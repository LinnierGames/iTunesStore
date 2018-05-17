//
//  MovieDetailViewController.swift
//  iTunesStore
//
//  Created by Erick Sanchez on 5/16/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit
import Kingfisher
import ChameleonFramework
import UIDesignables

class MovieDetailViewController: UIViewController {
    
    var movie: Movie!
    
    init(movie: Movie) {
        self.movie = movie
        
        super.init(nibName: "MovieDetailViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - RETURN VALUES
    
    // MARK: - VOID METHODS
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonPrice.cornerRadius = buttonPrice.bounds.height / 2.0
        buttonShare.cornerRadius = buttonShare.bounds.height / 2.0
    }
    
    private func updateUI() {
        guard self.movie != nil else {
            fatalError("movie was not set by a parent view controller")
        }
        
        labelTitle.text = movie.title
        buttonPrice.setTitle(movie.price, for: .normal)
        
        imageHeadline.kf.setImage(with: movie.compUrl) { [weak self] (image, error, _, _) in
            guard let unwrappedSelf = self, let image = image else { return }
            
            //change the colors of the buttons to match the image
            let averageColor = UIColor(averageColorFrom: image)
            let contrastingColor = UIColor(contrastingBlackOrWhiteColorOn: averageColor, isFlat: true)
            UIView.animate(withDuration: 0.25, animations: {
                unwrappedSelf.buttonPrice.backgroundColor = averageColor
                unwrappedSelf.buttonPrice.tintColor = contrastingColor
                unwrappedSelf.buttonShare.backgroundColor = averageColor
                unwrappedSelf.buttonShare.tintColor = contrastingColor
                
                unwrappedSelf.buttonBack.tintColor = contrastingColor
            })
        }
        
        let formattedDateString = movie.releaseDate.formattedStringWith(
            .Month_fullName, " ", .Day_ofTheMonthNoPadding, ", ", .Year_noPadding
        )
        labelReleaseDate.text = "Release Date: \(formattedDateString)"
    }
    
    // MARK: - IBACTIONS
    
    @IBOutlet weak var imageHeadline: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var buttonPrice: UIBootton!
    @IBAction func pressBuyOniTunes(_ sender: Any) {
        
    }
    
    @IBOutlet weak var buttonShare: UIBootton!
    @IBAction func pressShare(_ sender: Any) {
        
    }
    
    @IBOutlet weak var labelReleaseDate: UILabel!
    
    @IBOutlet weak var buttonBack: UIButton!
    @IBAction func pressBack(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController!.setNavigationBarHidden(true, animated: true)
    }
}
