//
//  ItemCollectionViewCell.swift
//  OLXClient
//
//  Created by Bryan on 24/03/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import UIKit
import SDWebImage

class ItemCollectionViewCell: UICollectionViewCell {
    //MARK: Properties
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.cellBorderColor().cgColor
        self.layer.borderWidth = 1
    }
    
    func setup(viewModel: ItemViewModel) {
        self.picture.sd_setImage(with: viewModel.imageURL)
        self.priceLabel.text = viewModel.priceText
        self.titleLabel.text = viewModel.titleText
    }
}
