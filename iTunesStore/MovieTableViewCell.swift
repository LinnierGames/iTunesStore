//
//  MovieTableViewCell.swift
//  iTunesStore
//
//  Created by Erick Sanchez on 5/16/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    private(set) var titleLabel: UILabel!
    
    private(set) var priceLabel: UILabel!
    
    private(set) var releaseDateLabel: UILabel!
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initLayout()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initLayout()
    }
    
    // MARK: - RETURN VALUES
    
    // MARK: - VOID METHODS
    
    func configure(_ movie: Movie) {
        titleLabel.text = movie.title
        priceLabel.text = movie.price
        let formattedDateString = movie.releaseDate.formattedStringWith(
            .Month_shorthand, " ", .Year_noPadding
        )
        releaseDateLabel.text = formattedDateString
    }
    
    private func initLayout() {
        let horzStackView = UIStackView()
        horzStackView.axis = .vertical
        
        //title label
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        horzStackView.addArrangedSubview(titleLabel)
        
        //price and release date
        let vertStackView = UIStackView()
        vertStackView.axis = .horizontal
        
        //price
        priceLabel = UILabel()
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        vertStackView.addArrangedSubview(priceLabel)
        
        //release date
        releaseDateLabel = UILabel()
        releaseDateLabel.textAlignment = .right
        
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        vertStackView.addArrangedSubview(releaseDateLabel)
        
        //layout
        vertStackView.translatesAutoresizingMaskIntoConstraints = false
        vertStackView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        horzStackView.addArrangedSubview(vertStackView)
        
        horzStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horzStackView)
        horzStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        horzStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        horzStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        layoutMarginsGuide.trailingAnchor.constraint(equalTo: horzStackView.trailingAnchor, constant: 8).isActive = true
    }
    
    // MARK: - IBACTIONS
    
    // MARK: - LIFE CYCLE

}
