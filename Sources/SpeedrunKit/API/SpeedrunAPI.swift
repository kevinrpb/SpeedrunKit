//
//  SpeedrunAPI.swift
//  SpeedrunKit
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation
import Combine

// MARK: - Error
public enum SpeedrunAPIError: Error {
    case networkError
    case decodingError
}

// MARK: - Response
public struct Pagination {
    let offset: Int
    let max: Int
    let size: Int
    let links: [Link]
}
extension Pagination: Decodable {}

public struct Response<Content> {
    let data: Content
    let pagination: Pagination?
}
extension Response: Decodable where Content: Decodable {}


// MARK: - SpeedrunAPI
public struct SpeedrunAPI {
    public static let shared: SpeedrunAPI = .init()

    private let decoder: JSONDecoder = .init()

    private init() {
        if #available(iOS 10.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
    }

    private func decode<T>(from data: Data) throws -> T where T: Decodable {
        do {
            let t: T = try decoder.decode(T.self, from: data)

            return t
        } catch DecodingError.keyNotFound(let key, let context) {
            print("ERROR: could not find key \(key) in JSON: \(context.debugDescription) (\(context.codingPath))")
            throw SpeedrunAPIError.decodingError
        } catch DecodingError.valueNotFound(let type, let context) {
            print("ERROR: could not find type \(type) in JSON: \(context.debugDescription) (\(context.codingPath))")
            throw SpeedrunAPIError.decodingError
        } catch DecodingError.typeMismatch(let type, let context) {
            print("ERROR: type mismatch for type \(type) in JSON: \(context.debugDescription) (\(context.codingPath))")
            throw SpeedrunAPIError.decodingError
        } catch DecodingError.dataCorrupted(let context) {
            print("ERROR: data found to be corrupted in JSON: \(context.debugDescription) (\(context.codingPath))")
            throw SpeedrunAPIError.decodingError
        } catch let error as NSError {
            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            throw error
        } catch {
            throw error
        }
    }

    @available(iOS 15.0, *)
    public func call<Result>(
        _ endpoint: Endpoint,
        with pagination: Pagination? = nil
    ) async throws -> Response<Result> where Result: Decodable {
        let request = buildRequest(for: endpoint, with: pagination)
        let (data, _) = try await URLSession.shared.data(for: request)

        let response: Response<Result> = try decode(from: data)

        return response
    }

    public func call<Result>(
        _ endpoint: Endpoint,
        with pagination: Pagination? = nil,
        completion: @escaping (Response<Result>?, Error?) -> Void
    ) where Result: Decodable {
        let request = buildRequest(for: endpoint, with: pagination)

        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                guard let data = data else {
                    completion(nil, SpeedrunAPIError.networkError)
                    return
                }

                let response: Response<Result> = try decode(from: data)

                completion(response, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }

    @available(iOS 13.0, *)
    public func call<Result>(
        _ endpoint: Endpoint,
        with pagination: Pagination? = nil
    ) throws -> AnyPublisher<Response<Result>, Error> where Result: Decodable {
        let request = buildRequest(for: endpoint, with: pagination)
        
        let publisher = URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, _) -> Response<Result> in
                try decode(from: data)
            }
            .eraseToAnyPublisher()

        return publisher
    }

    private func buildRequest(for endpoint: Endpoint, with pagination: Pagination? = nil) -> URLRequest {
        var components = URLComponents(url: endpoint.url, resolvingAgainstBaseURL: true)!

        if let pagination = pagination {
            components.queryItems = [
                URLQueryItem(name: "offset", value: "\(pagination.offset)"),
                URLQueryItem(name: "max", value: "\(pagination.max)")
            ]
        }

        var request = URLRequest(url: components.url!)
        request.httpMethod = endpoint.method.rawValue

        return request
    }
}
