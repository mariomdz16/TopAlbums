//
//  ViewController.swift
//  Top Albums
//
//  Created by Mario A Mendez on 3/28/20.
//  Copyright © 2020 XTeam. All rights reserved.
//

import UIKit

//MARK: - AlbumsTableViewController

class AlbumsTableViewController: UITableViewController {
    
    
    //MARK: - Class Constants
    
    static let title = "Top 100 Albums"
    
    
    //MARK: - Variables and Properties
    
    var albums = [Album]()
    
    var event: Event? {
        didSet {
            if let albumsArr = event?.albums, !albumsArr.isEmpty, isViewLoaded {
                albums = albumsArr
                tableView.reloadData()
            }
        }
    }

    // MARK: - ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        title = AlbumsTableViewController.title
        tableView.register(AlbumCell.self, forCellReuseIdentifier: AlbumCell.identifier)
    }
    
    func configureCell(_ cell: AlbumCell, forIndexPath indexPath: IndexPath) {
        cell.album = albums[indexPath.row]
        
        if albums[indexPath.row].imageData == nil {
            guard let artWorkURL = albums[indexPath.row].artworkUrl100,
                let url = URL(string: artWorkURL) else {
                    return
            }
            
            fetchAlbumImageWith(url: url, forIndexPath: indexPath)
        }
    }

    func fetchAlbumImageWith(url: URL, forIndexPath indexPath: IndexPath) {
        WebService.loadAlbumImage(forUrl: url) { (imageData, success) in
            OperationQueue.main.addOperation {
                let cell = self.tableView.cellForRow(at: indexPath) as? AlbumCell
                self.albums[indexPath.row].imageData = imageData
                cell?.albumImageData = self.albums[indexPath.row].imageData

                self.updateAlbumDetailsViewControllerIfNeeded(albumIndex: indexPath.row,
                                                              imageData: imageData)
            }
        }
    }

    func updateAlbumDetailsViewControllerIfNeeded(albumIndex: Int, imageData: Data?) {
        if let albumDetailsViewController = navigationController?.visibleViewController as? AlbumDetailsViewController,albumDetailsViewController.album == albums[albumIndex] {
                albumDetailsViewController.albumImageData = imageData
        }
    }
    
    //MARK: - TableViewDataSource Protocol
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.identifier, for: indexPath) as? AlbumCell else { return UITableViewCell() }
        configureCell(cell, forIndexPath: indexPath)
        return cell
    }
    
    //MARK: - TableViewDelegate Protocol
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailViewController = AlbumDetailsViewController()
        detailViewController.album = albums[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}


