//
//  AlbumCell.swift
//  Top Albums
//
//  Created by Mario A Mendez on 3/29/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import Foundation
import UIKit


// MARK: - Album Cell

final class AlbumCell: UITableViewCell {
    
    // MARK: - Class Constants
    
    static let identifier = "AlbumCell"
    static let labelNumberOfLines = 2
    static let imageToWidthRatio: CGFloat = 0.25
    
    
    // MARK: - Variales and Properties
    
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return imageView
    }()
    
    let albumTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = AlbumCell.labelNumberOfLines
        return label
    }()
    
    let albumArtistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = AlbumCell.labelNumberOfLines
        return label
    }()
    
    let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Constants.padding5
        stackView.alignment = .leading
        stackView.distribution = .fill
        return stackView
    }()
    
    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = Constants.padding8
        stackView.alignment = .leading
        return stackView
    }()
    
    var album: Album? {
        didSet {
            albumTitleLabel.text = album?.name
            albumArtistLabel.text = album?.artistName
            albumImageData = album?.imageData
        }
    }
    
    var albumImageData: Data? {
        didSet {
            if let imageData = albumImageData {
                OperationQueue.main.addOperation {
                    self.albumImageView.removeActivityIndicator()
                    self.albumImageView.image = UIImage(data: imageData)
                }
            } else {
                albumImageView.addActivityInidicator()
            }
        }
    }
    
    
    // MARK: - Table View Cell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        albumTitleLabel.text = nil
        albumArtistLabel.text = nil
        albumImageView.image = nil
    }
    
    private func setupView() {
        labelsStackView.addArrangedSubviews(albumTitleLabel, albumArtistLabel)
        containerStackView.addArrangedSubviews(albumImageView, labelsStackView)
        contentView.addSubview(containerStackView)
    }
    
    private func setupConstrainsts() {
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                        constant: Constants.padding20),
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                    constant: Constants.padding10),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                         constant: -Constants.padding20),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                       constant: -Constants.padding10),
            
            albumImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor,
                                                  multiplier: AlbumCell.imageToWidthRatio),
            albumImageView.heightAnchor.constraint(equalTo: albumImageView.widthAnchor)
        ])
    }
}
