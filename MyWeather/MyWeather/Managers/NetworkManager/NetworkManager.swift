//
//  NetworkManager.swift
//  MyWeather
//
//  Created by Valerii on 26.10.2023.
//

import Foundation

class NetworkManager <Target: TargetType> {
    
    //MARK: url
    private func createURL(servise: Target) -> URL? {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = servise.baseURL
        urlComponents.path = servise.path
        
        switch servise.task {
        case .requestPlain:
            break
        case .requestParameters(parameters: let parameters):
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        return urlComponents.url
    }
    
    //MARK: request
    private func makeURLRequest(servise: Target) throws -> URLRequest {
        guard let url = createURL(servise: servise) else {
            throw APIError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = servise.headers
        
        return request
    }
    
    //MARK: fetch data
    func fetchData<T: Decodable>(_ type: T.Type, servise: Target, completion: @escaping (Result<T, APIError>) -> Void) {
        
        // URLRequest
        guard let request = try? makeURLRequest(servise: servise) else {
            completion(Result.failure(APIError.badURL))
            return
        }
        print(request.url!)
        // URLSession
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // error
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
                
                // response
            } else if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: httpResponse.statusCode)))
                
                // data
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }.resume()
    }
}
