//
//  NetworkService.swift
//  Unsplash
//
//  Created by Кирилл Дамковский on 10.07.2022.
//

import UIKit

class NetworkService {
    static func getRandomPhotos(completion: @escaping ([UnsplashPhotoModel]) -> ()) {

        guard let randomPhotoAPI = URL(string: "https://api.unsplash.com/photos/random?client_id=rzyo2bSByBGLmwRPGrKThUQe1jkNg8czXCF4iL-QVx4&count=10") else { return }

        let task = URLSession.shared.dataTask(with: randomPhotoAPI) { data, response, error in
            guard error == nil else {
                return print(error?.localizedDescription ?? "Unknown Error")
            }

            guard let data = data else { return }

            guard let photos = try? JSONDecoder().decode([UnsplashPhotoModel].self, from: data) else {
                return print("Error: can't parsing JSON")
            }
            completion(photos)
        }
        task.resume()
    }

    static func dowloadPhotoImage(photoURL: String, completion: @escaping (UIImage) -> ()) {
        guard let URL = URL(string: photoURL) else { return }

        let task = URLSession.shared.dataTask(with: URL) { data, response, error in
            guard error == nil else {
                return print(error?.localizedDescription ?? "Unknown Error")
            }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            completion(image)
        }
        task.resume()
    }
}
