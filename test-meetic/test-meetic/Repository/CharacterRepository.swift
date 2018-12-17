//
//  CharacterRepository.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import Alamofire

protocol CharacterRepositoryType {
    func getCharacters(successHandler: @escaping ([Character]) -> Void)
    func getCharacter(with id: Int, successHandler: @escaping (Character) -> Void)
}

final class CharacterRepository: CharacterRepositoryType {
    func getCharacters(successHandler: @escaping ([Character]) -> Void) {
        Alamofire.request(Router.getCharacters())
            .responseData(completionHandler: { response in
                switch response.result {
                case .success(let data):
                    if let characterPage = try? JSONDecoder().decode(CharactersPage.self, from: data) {
                        successHandler(characterPage.characters)
                    }
                case .failure(let error):
                    print("\(error)")
                }
            })
    }

    func getCharacter(
        with id: Int,
        successHandler: @escaping (Character) -> Void) {
        Alamofire.request(Router.getCharacter(id: id))
            .responseData(completionHandler: { response in
                switch response.result {
                case .success(let data):
                    if let character = try? JSONDecoder().decode(Character.self, from: data) {
                        successHandler(character)
                    }
                case .failure(let error):
                    print("\(error)")
                }
            })
    }
}
