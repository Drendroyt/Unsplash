//
//  PhotoCollectionViewCell.swift
//  Unsplash
//
//  Created by Кирилл Дамковский on 10.07.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    private lazy var photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout(){
        contentView.addSubview(photoView)

        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func setupCell(image: UIImage) {
        photoView.image = image
    }
    
}
