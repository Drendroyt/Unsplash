//
//  UnsplashPhotoModel.swift
//  Unsplash
//
//  Created by Кирилл Дамковский on 10.07.2022.
//

import Foundation
import UIKit

struct UnsplashPhotoModel: Decodable {
    let id: String
    let created_at: String
    let user: UserInfo
    let urls: PhotoURL
    let views: Int
    let downloads: Int

    struct UserInfo: Decodable {
        let name: String
        let location: String?
        let profile_image: ImageURL
    }

    struct PhotoURL: Decodable {
        let thumb: String
        let regular: String
    }

    struct ImageURL: Decodable {
        let large: String
    }

}
