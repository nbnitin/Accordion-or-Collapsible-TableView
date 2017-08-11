//
//  ViewController.swift
//  ExpandableMenuOrAccordion
//
//  Created by Nitin Bhatia on 09/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var setText = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let lbl = UILabel()
        lbl.frame = CGRect.zero
        lbl.text = setText
        lbl.backgroundColor = UIColor.red
        lbl.textAlignment = .center
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: lbl, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        let verticalConstraint = NSLayoutConstraint(item: lbl, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 1.0)
        
        let leadingConstraint = NSLayoutConstraint(item: lbl, attribute: .leading, relatedBy: .lessThanOrEqual, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 16)
        let trailingConstraint = NSLayoutConstraint(item: lbl, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 16)
       
        let height = NSLayoutConstraint(item: lbl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        self.view.addSubview(lbl)
        self.view.addConstraints([horizontalConstraint,verticalConstraint,leadingConstraint,trailingConstraint,height])
    }

    

}
