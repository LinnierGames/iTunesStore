//
//  HeaderImageView.swift
//  iTunesStore
//
//  Created by Erick Sanchez on 5/16/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class HeaderImageView: UIImageView {
    
    private lazy var graidentLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        let colors: [UIColor] = [.clear, .clear, UIColor.black.withAlphaComponent(0.9)]
        layer.colors = colors.map { $0.cgColor }
        layer.locations = [0, 0.7, 1]
        layer.frame = self.bounds
        self.layer.addSublayer(layer)
        
        return layer
    }()
    
    // MARK: - RETURN VALUES
    
    // MARK: - VOID METHODS
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        graidentLayer.frame = bounds
    }
    
    // MARK: - IBACTIONS
    
    // MARK: - LIFE CYCLE

}
