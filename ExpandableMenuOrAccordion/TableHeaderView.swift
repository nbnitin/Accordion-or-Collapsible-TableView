//
//  TableHeaderView.swift
//  ExpandableMenuOrAccordion
//
//  Created by Nitin Bhatia on 09/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

//protocol to handle section toggling
protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: TableHeaderView, section: Int)
}



class TableHeaderView: UITableViewHeaderFooterView {

    
    
        
        var delegate: CollapsibleTableViewHeaderDelegate?
        var section: Int = 0
        
        let titleLabel = UILabel()
        let arrowLabel = UILabel()
        
        override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
            /*************************/
            //NOTE:-
            //Below code sometime give warning or not statisfactory result in the view or of the view to
            //get rid of that i am pasting here new also uncomment to use that with label 1
         /**********************/
            // Content View
            contentView.backgroundColor = UIColor(hex: 0x2E3944)
            
            let marginGuide = contentView.layoutMarginsGuide
            
            // Arrow label
            contentView.addSubview(arrowLabel)
            arrowLabel.textColor = UIColor.white
            arrowLabel.translatesAutoresizingMaskIntoConstraints = false
            arrowLabel.widthAnchor.constraint(equalToConstant: 12).isActive = true
            arrowLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
            arrowLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
            arrowLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true

            // Title label
            contentView.addSubview(titleLabel)
            titleLabel.textColor = UIColor.white
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
            titleLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true

            
            
            //1:- Uncomment to if dont get statisfactory result from above code
            // Arrow label
//            contentView.addSubview(arrowLabel)
//            arrowLabel.textColor = UIColor.white
//            arrowLabel.translatesAutoresizingMaskIntoConstraints = false
//            let trailingLabel = NSLayoutConstraint(item: arrowLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -16)
//            let topLabel = NSLayoutConstraint(item: arrowLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10.5)
//            let heightLabel = NSLayoutConstraint(item: arrowLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10)
//            let widthLabel = NSLayoutConstraint(item: arrowLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant:  10)
//
//            // Title label
//            contentView.addSubview(titleLabel)
//            titleLabel.textColor = UIColor.white
//
//            titleLabel.translatesAutoresizingMaskIntoConstraints = false
//            let leading = NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 8)
//            let top = NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 8)
//            let height = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 21)
//            let width = NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant:  80)
//
//            self.addConstraints([leading,top,width,height])
//            self.addConstraints([trailingLabel,topLabel,widthLabel,heightLabel])
//
            
            
            //
            // Call tapHeader when tapping on this header
            //
            addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapHeader(_:))))
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        //
        // Trigger toggle section when tapping on the header
        //
        func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
            guard let cell = gestureRecognizer.view as? TableHeaderView else {
                return
            }
            
            delegate?.toggleSection(self, section: cell.section)
        }
        
        func setCollapsed(_ collapsed: Bool) {
            //
            // Animate the arrow rotation (see Extensions.swf)
            //
            arrowLabel.rotate(collapsed ? 0.0 : .pi / 2)
        }
        
}


