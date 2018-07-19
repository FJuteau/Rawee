//
//  Network.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 24/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation
import Alamofire

enum APICredentials {
    static let key = "9f3cdf6f83a5a160c525cd7ce9df4591"
    static let token = "8a5a8cf590e32324d12599504141c826"
    static let securityTokenPath = "/?key=\(key)&token=\(token)"
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}



struct Query {
    let method: HTTPMethod
    let baseURL: URL = URL(string: "http://mvp.rawee.online/edd-api/")!
    let path: String
    let queryItems: [String: String?]?
    let parameters: [String: Any]?
    let securityKey: String?
}

class RequestConvertible: URLRequestConvertible {

    let query: Query

    var url: URL {
        var url = query.baseURL.appendingPathComponent(query.path)
        if let securityKey = query.securityKey {
            url = url.appendingPathComponent(securityKey)
        }
        return url
    }

    /// Get the encoding depending of the router selected
    private var encoding: ParameterEncoding {
        if query.parameters != nil {
            return URLEncoding(destination: .methodDependent)
        }
        else {
            return JSONEncoding.default
        }
    }

    init(_ query: Query) {
        self.query = query
    }

    func asURLRequest() throws -> URLRequest {
        var component: URLComponents? = URLComponents(string: url.absoluteString)
        component?.queryItems = query.queryItems?.map { URLQueryItem(name: $0.key, value: $0.value) }
        var urlRequest = URLRequest(url: component!.url!)

        urlRequest.httpMethod = query.method.rawValue

        return try encoding.encode(urlRequest, with: query.parameters)
    }


}
final class Network {
    func request<T: Codable>(query: Query, parser: WebserviceParser<T>) {
        Alamofire.request(RequestConvertible(query))
            .validate()
            .responseJSON { response in
                guard let data = response.data else { return }
                parser.parse(response: data)
        }
    }
}
