//
//  ItemDetailsViewController.swift
//  OLXClient
//
//  Created by Bryan on 24/03/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var picture: UIImageView!
    var viewModel: ItemViewModel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        picture.sd_setImage(with: viewModel.imageURL)
        self.title = viewModel.titleText
        self.titleLabel.text = viewModel.titleText
        self.addressLabel.text = viewModel.displayLocationText
        self.detailsLabel.text = viewModel.detailsText
        self.dateLabel.text = viewModel.dateTimeText
        self.priceLabel.text = viewModel.priceText
        
        //adding fade in bottom of imageView
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 100)
        gradient.colors = [UIColor.clear.cgColor, UIColor.fadeColor().cgColor]
        gradient.locations = [0.0, 0.5]
        picture.layer.insertSublayer(gradient, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ItemDetailsViewController {
    //MARK: Methods
    @IBAction func showInMap(_ sender: Any) {
        let vc = MapViewController(nibName: "MapViewController", bundle: nil)
        vc.viewModel = self.viewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
