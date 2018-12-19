//
//  CharacterRepository.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import Alamofire

protocol CharacterRepositoryType {
    func getCharacters(page: Int, completionHandler: @escaping (Result<CharactersPage>) -> Void)
    func getCharacter(with id: Int, completionHandler: @escaping (Result<Character>) -> Void)
}

enum CharacterError: Error {
    case invalidResponseData
}

final class CharacterRepository: CharacterRepositoryType {
    func getCharacters(page: Int, completionHandler: @escaping (Result<CharactersPage>) -> Void) {
        Alamofire.request(Router.getCharacters(page: page))
            .responseData(completionHandler: { response in
                switch response.result {
                case .success(let data):
                    if let charactersPage = try? JSONDecoder().decode(CharactersPage.self, from: data) {
                        completionHandler(.success(charactersPage))
                    } else {
                        completionHandler(.error(CharacterError.invalidResponseData))
                    }
                case .failure(let error):
                    completionHandler(.error(error))
                }
            })
    }

    func getCharacter(
        with id: Int,
        completionHandler: @escaping (Result<Character>) -> Void) {
        Alamofire.request(Router.getCharacter(id: id))
            .responseData(completionHandler: { response in
                switch response.result {
                case .success(let data):
                    if let character = try? JSONDecoder().decode(Character.self, from: data) {
                        completionHandler(.success(character))
                    } else {
                        completionHandler(.error(CharacterError.invalidResponseData))
                    }
                case .failure(let error):
                    completionHandler(.error(error))
                }
            })
    }
}
