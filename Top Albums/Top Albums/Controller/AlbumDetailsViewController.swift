//
//  AlbumDetailsViewController.swift
//  Top Albums
//
//  Created by Mario A Mendez on 3/29/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import Foundation
import UIKit
import StoreKit


// MARK: - AlbumDetailsViewController

class AlbumDetailsViewController: UIViewController {
    
    // MARK: - Class Constants
    
    static let title = "Album Details"
    static let iTunesButtonTitle = "See in iTunes"
    static let buttonHeightToWidthRatio: CGFloat = 0.1
    
    // MARK: - Variables and Properties
    
    var album: Album? {
        didSet {
            albumImageData = album?.imageData
            albumDetailsTextView.text = album?.description
        }
    }
    
    var albumImageData: Data? {
        didSet {
            if let imageData = albumImageData {
                albumImageView.removeActivityIndicator()
                albumImageView.image = UIImage(data: imageData)
            } else {
                albumImageView.addActivityInidicator()
            }
        }
    }
    
    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Constants.padding10
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()
    
    let albumDetailsTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.autocapitalizationType = .sentences
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        textView.isEditable = false
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        textView.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
        return textView
    }()
    
    let iTunesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(AlbumDetailsViewController.iTunesButtonTitle, for: .normal)
        button.backgroundColor = .black
        button.setContentHuggingPriority(.defaultHigh, for: .vertical)
        button.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        button.addTarget(self, action: #selector(presentStoreProductViewController), for: .touchUpInside)
        return button
    }()

    // MARK: - ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        title = AlbumDetailsViewController.title
        view.backgroundColor = .white

        containerStackView.addArrangedSubviews(albumImageView, albumDetailsTextView, iTunesButton)
        view.addSubview(containerStackView)
    }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
                                                        constant: Constants.padding20),
            containerStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
                                                         constant: -Constants.padding20),
            containerStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,
                                                       constant: -Constants.padding20),
            
            iTunesButton.heightAnchor.constraint(equalTo: safeArea.heightAnchor,
                                                 multiplier: AlbumDetailsViewController.buttonHeightToWidthRatio)
        ])
    }
}

// MARK: - SKStoreProductViewControllerDelegate Protocol

extension AlbumDetailsViewController: SKStoreProductViewControllerDelegate {
    @objc func presentStoreProductViewController(_ sender: UIButton) {
        sender.isEnabled = false
        guard let idString = album?.id, let id = Int(idString) else { return }
        
        let storeViewController = SKStoreProductViewController()
        storeViewController.delegate = self
        let parametersDict = [SKStoreProductParameterITunesItemIdentifier: id]
        storeViewController.loadProduct(withParameters: parametersDict) { (success, error) in
            sender.isEnabled = true

            if success {
                self.present(storeViewController, animated: true, completion: nil)
                return
            }
            
            if let error = error {
                debugPrint("Error: \(error.localizedDescription)")
            }
        }
    }
}
