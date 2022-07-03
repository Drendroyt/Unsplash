//
//  NetworkManager.swift
//  Unsplash
//
//  Created by Кирилл Дамковский on 27.06.2022.
//

import Foundation

class NetworkManager {
    static func getRandomPhoto(completion: @escaping ([PhotoStruct]) -> ()) {

        let stringURL = "https://api.unsplash.com/photos/random?client_id=DSV-NbQccpd7NlczEEJhJoj_ybVm_vwCFZPrsZrKD6U&count=20"

        guard let URL = URL(string: stringURL) else { return }

        let task = URLSession.shared.dataTask(with: URL) { data, response, error in

            guard error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }

            guard let JSON = data else { return }
            guard let photosArray = try? JSONDecoder().decode([PhotoStruct].self, from: JSON) else {
                print("Error pasring JSON")
                return
            }
            completion(photosArray)
        }

        task.resume()
    }
}
