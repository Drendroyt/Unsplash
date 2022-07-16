//
//  PhotoDetailViewController.swift
//  Unsplash
//
//  Created by Кирилл Дамковский on 16.07.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    lazy var photoModel: UnsplashPhotoModel? = nil

    private lazy var photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray5
        return imageView
    }()

    private lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()

    private lazy var titlesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()

    private lazy var authorNameTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var authorLocationTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .systemGray5
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true

        return imageView
    }()

    private lazy var photoInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()

    private lazy var dateTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var downloadCountTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoyt()
        setupView()
    }

    private func layoyt() {
        let viewInset: CGFloat = 20

        [authorNameTitle, authorLocationTitle].forEach { titlesStackView.addArrangedSubview($0) }

        [avatarImageView, titlesStackView].forEach { userInfoStackView.addArrangedSubview($0) }

        [dateTitle, downloadCountTitle].forEach { photoInfoStackView.addArrangedSubview($0) }

        [userInfoStackView, photoView, photoInfoStackView].forEach { view.addSubview($0) }

        NSLayoutConstraint.activate([

            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
            avatarImageView.widthAnchor.constraint(equalToConstant: 80),

            userInfoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userInfoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            userInfoStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            photoView.topAnchor.constraint(equalTo: userInfoStackView.bottomAnchor, constant: viewInset),
            photoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5),

            photoInfoStackView.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: viewInset),
            photoInfoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoInfoStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

        ])
    }

    private func setupView() {
        guard let photoModel = self.photoModel else { return }
        NetworkService.dowloadPhotoImage(photoURL: photoModel.urls.regular) { photoImage in
            DispatchQueue.main.async {
                self.photoView.image = photoImage
            }
        }
        NetworkService.dowloadPhotoImage(photoURL: photoModel.user.profile_image.large) { avatarImage in
            DispatchQueue.main.async {
                self.avatarImageView.image = avatarImage
            }
        }
        self.authorNameTitle.text = photoModel.user.name
        self.authorLocationTitle.text = photoModel.user.location
        self.dateTitle.text = "Date: " + photoModel.created_at
        self.downloadCountTitle.text = "Downloads: " + String(photoModel.downloads)
    }
}
