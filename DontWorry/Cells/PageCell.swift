//
//  PageCell.swift
//  TabBarTest
//
//  Created by Chan-Seon Park on 2019. 3. 27..
//  Copyright © 2019년 Chan. All rights reserved.
//
import UIKit

class PageCell: UICollectionViewCell {
    
    var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(label)
        self.backgroundColor = .gray
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
