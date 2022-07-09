//
//  GalleryViewController.swift
//  Unsplash
//
//  Created by Кирилл Дамковский on 21.06.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        NetworkService.getRandomPhotos { photos in
            print(photos.count)
        }
    }

    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Галерея"
    }

}
