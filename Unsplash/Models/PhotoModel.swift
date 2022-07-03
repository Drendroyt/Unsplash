//
//  PhotoModel.swift
//  Unsplash
//
//  Created by Кирилл Дамковский on 27.06.2022.
//

import Foundation

struct PhotoStruct: Decodable {
        let id: String
        let created_at: String
        let user: UserInfo
        let downloads: Int

        struct UserInfo: Decodable {
            let name: String
            let location: String
        }
}

var photosCount:Int = 0

let photosArray = NetworkManager.getRandomPhoto { photosArray in
    photosCount = photosArray.count
}



