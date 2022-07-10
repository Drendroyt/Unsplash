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
        layout()
    }

    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Галерея"
    }

    private func layout() {
        let photosVC = PhotosViewController()
        photosVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photosVC.view)
        self.addChild(photosVC)
        photosVC.didMove(toParent: self)

        NSLayoutConstraint.activate([
            photosVC.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            photosVC.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            photosVC.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            photosVC.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
