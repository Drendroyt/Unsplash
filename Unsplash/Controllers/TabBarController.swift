//
//  TabBarController.swift
//  Unsplash
//
//  Created by Кирилл Дамковский on 21.06.2022.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: Proretries

    private enum TabBarItem {
        case gallery
        case favorite

        var title: String {
            switch self {
            case .gallery:
                return "Галерея"
            case .favorite:
                return "Избранное"
            }
        }

        var image: UIImage? {
            switch self {
            case .gallery:
                return UIImage(systemName: "photo.circle")
            case .favorite:
                return UIImage(systemName: "star.circle")
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()

    }

    // MARK: Methods

    private func setupTabBar() {
        let items: [TabBarItem] = [.gallery, .favorite]
        self.viewControllers = items.map({ TabBarItem in
            switch TabBarItem {
            case .gallery:
                return UINavigationController(rootViewController: GalleryViewController())
            case .favorite:
                return UINavigationController(rootViewController: FavoriteViewController())
            }
        })

        self.viewControllers?.enumerated().forEach({ index, vc in
            vc.tabBarItem.title = items[index].title
            vc.tabBarItem.image = items[index].image
        })
    }

}
