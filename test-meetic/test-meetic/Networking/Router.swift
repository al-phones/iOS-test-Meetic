//
//  Router.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    case getCharacters()
    case getCharacter(id: Int)

    static let baseURLString = "https://rickandmortyapi.com/api"

    var method: HTTPMethod {
        switch self {
        case .getCharacters,
             .getCharacter:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getCharacters:
            return "/character"
        case .getCharacter(let id):
            return "/character/\(id)"
        }
    }

    // MARK: URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
