//
//  UIMoviesTableViewController.swift
//  iTunesStore
//
//  Created by Erick Sanchez on 5/16/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    private var movies = [Movie]()
    
    private lazy var network = NetworkingStack()
    
    // MARK: - RETURN VALUES
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie cell", for: indexPath) as! MovieTableViewCell
        
        let movie = self.movies[indexPath.row]
        cell.configure(movie)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    // MARK: - VOID METHODS
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = self.movies[indexPath.row]
        let detailedVc = MovieDetailViewController(movie: selectedMovie)
        
        self.navigationController!.pushViewController(detailedVc, animated: true)
    }
    
    // MARK: - IBACTIONS
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Top Movies"
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movie cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        
        network.topMoves { (result) in
            switch result {
            case .success(let movies):
                self.movies = movies
                self.tableView.reloadData()
            case .failure:
                let alertError = UIAlertController(title: "iTunes Store", message: "failed to download movies", preferredStyle: .alert)
                alertError.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertError, animated: true)
            }
        }
    }

}
