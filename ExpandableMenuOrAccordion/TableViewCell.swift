//
//  TableViewCell.swift
//  ExpandableMenuOrAccordion
//
//  Created by Nitin Bhatia on 09/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
        //creating two label for title and detail
        let nameLabel = UILabel()
        let detailLabel = UILabel()
        
        // MARK: Initalizers
        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            let marginGuide = contentView.layoutMarginsGuide
           //giving constraints 
            // configure nameLabel
            contentView.addSubview(nameLabel)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
            nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
            nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
            nameLabel.numberOfLines = 0
            nameLabel.font = UIFont.systemFont(ofSize: 16)
            
            // configure detailLabel
            contentView.addSubview(detailLabel)
            detailLabel.lineBreakMode = .byWordWrapping
            detailLabel.translatesAutoresizingMaskIntoConstraints = false
            detailLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
            detailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
            detailLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
            detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
            detailLabel.numberOfLines = 0
            detailLabel.font = UIFont.systemFont(ofSize: 12)
            detailLabel.textColor = UIColor.lightGray
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    

}
