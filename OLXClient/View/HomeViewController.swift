//
//  HomeViewController.swift
//  OLXClient
//
//  Created by Bryan on 24/03/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import UIKit
import ZOZolaZoomTransition

class HomeViewController: UIViewController {
    //MARK: Constants
    fileprivate let kServerLocation = "www.olx.com.ar"
    private let kWelcomeText = "OLX"
    private let kLookForString = "What are you looking for?".localized()
    fileprivate let cellIdentifier = "ItemCollectionViewCell"
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    
    //MARK: Properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var items = [ItemViewModel]()
    var selectedCell: ItemCollectionViewCell!
    
    //MARK: UIViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = kWelcomeText
        self.searchBar.placeholder = kLookForString
        self.collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        self.listCachedItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension HomeViewController {
    //MARK: Methods
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        self.collectionView.layoutIfNeeded()
    }
    
    func listCachedItems() {
        self.items =  OLXApiRequests.loadCachedSearch()
        self.collectionView.reloadData()
    }
}

//MARK: UICollectionView Protocol

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ItemCollectionViewCell
        cell.setup(viewModel: items[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCell = collectionView.cellForItem(at: indexPath) as! ItemCollectionViewCell!
        let vc = ItemDetailsViewController(nibName: "ItemDetailsViewController", bundle: nil)
        vc.viewModel = items[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

//MARK: UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //perform search in server
        OLXApiRequests.searchItemsWithTerm(term: searchBar.text!, inLocation: kServerLocation, pageSize: 20, offset: 5) { (items) in
            self.items = items
            self.collectionView.reloadData()
        }
    }
}
