//
//  SpeedrunAPI.swift
//  
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
protocol ResponseProtocol {
    associatedtype ContentType

    var data: ContentType { get }
}

struct Response<Content>: ResponseProtocol {
    let data: Content
}
extension Response: Decodable where Content: Decodable {}

// MARK: - SpeedrunAPI
public struct SpeedrunAPI {
    public static let shared: SpeedrunAPI = .init()

    private let decoder: JSONDecoder = .init()

    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }

    @available(iOS 15.0, *)
    public func call<Result>(_ endpoint: Endpoint) async throws -> Result where Result: Decodable {
        do {
            let request = buildRequest(for: endpoint)
            let (data, _) = try await URLSession.shared.data(for: request)

            return try decoder.decode(Result.self, from: data)
        } catch is DecodingError {
            throw SpeedrunAPIError.decodingError
        } catch {
            throw error
        }
    }

    public func call<Result>(_ endpoint: Endpoint, completion: @escaping (Result?, Error?) -> Void) where Result: Decodable {
        let request = buildRequest(for: endpoint)

        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                guard let data = data else {
                    completion(nil, SpeedrunAPIError.networkError)
                    return
                }

                let result = try decoder.decode(Result.self, from: data)

                completion(result, nil)
            } catch is DecodingError {
                completion(nil, SpeedrunAPIError.decodingError)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }

    public func call<Result>(_ endpoint: Endpoint) throws -> AnyPublisher<Result, Error> where Result: Decodable {
        let request = buildRequest(for: endpoint)
        
        let publisher = URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, _) in
                return try decoder.decode(Result.self, from: data)
            }
            .mapError { error -> Error in
                switch error {
                case is DecodingError:
                    return SpeedrunAPIError.decodingError
                default:
                    return error
                }
            }
            .eraseToAnyPublisher()

        return publisher
    }

    private func buildRequest(for endpoint: Endpoint) -> URLRequest {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue

        return request
    }
}
