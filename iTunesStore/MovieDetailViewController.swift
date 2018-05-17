//
//  MovieDetailViewController.swift
//  iTunesStore
//
//  Created by Erick Sanchez on 5/16/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

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
        
    }
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUI()
    }

}
