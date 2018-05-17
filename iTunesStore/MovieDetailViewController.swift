//
//  MovieDetailViewController.swift
//  iTunesStore
//
//  Created by Erick Sanchez on 5/16/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit
import Kingfisher

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
    
    private func updateUI() {
        guard self.movie != nil else {
            fatalError("movie was not set by a parent view controller")
        }
        
        imageHeadline.kf.setImage(with: movie.compUrl)
        labelTitle.text = movie.title
        buttonPrice.setTitle(movie.price, for: .normal)
        let formattedDateString = movie.releaseDate.formattedStringWith(
            .Month_fullName, " ", .Day_ofTheMonthNoPadding, ", ", .Year_noPadding
        )
        labelReleaseDate.text = "Release Date: \(formattedDateString)"
    }
    
    // MARK: - IBACTIONS
    
    @IBOutlet weak var imageHeadline: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var buttonPrice: UIButton!
    @IBAction func pressBuyOniTunes(_ sender: Any) {
        
    }
    
    @IBAction func pressShare(_ sender: Any) {
        
    }
    
    @IBOutlet weak var labelReleaseDate: UILabel!
    
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
