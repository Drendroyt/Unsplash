//
//  NetworkService.swift
//  Unsplash
//
//  Created by Кирилл Дамковский on 10.07.2022.
//

import Foundation
import UIKit

class NetworkService {
    static func getRandomPhotos(completion: @escaping ([UnsplashPhotoModel]) -> ()) {

        guard let randomPhotoAPI = URL(string: "https://api.unsplash.com/photos/random?client_id=DSV-NbQccpd7NlczEEJhJoj_ybVm_vwCFZPrsZrKD6U&count=10") else { return }

        let task = URLSession.shared.dataTask(with: randomPhotoAPI) { data, response, error in
            guard error == nil else {
                return }

            guard let data = data else { return }

            guard let photos = try? JSONDecoder().decode([UnsplashPhotoModel].self, from: data) else {
                return print("Error: can't parsing JSON")
            }
            completion(photos)
        }
        task.resume()
    }
}
