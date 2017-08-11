//
//  TableViewController.swift
//  ExpandableMenuOrAccordion
//
//  Created by Nitin Bhatia on 09/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,CollapsibleTableViewHeaderDelegate {
    
    //section data we made or decalred in tableviewdata file
    
    var sections = sectionData

    override func viewDidLoad() {
        super.viewDidLoad()
        //setting estimated row height of table view
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //here we are checking if its collapsed true then only we are showing its counting to show item inside in it.
        
        return sections[section].is_collapsed ? 0 : sections[section].item.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //here we are creating cells with title label and detail label which we made customly in tableview cell class , also we gave constraints to set height of table cell  according to content in detailLabel
        
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell ?? TableViewCell(style: .default, reuseIdentifier: "cell")
        cell.nameLabel.text = sections[indexPath.section].item[indexPath.row].name
        cell.detailLabel.text = ""

        return cell
    }
    
    var selectedText = ""
    
   //opening new VC
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedText = sections[indexPath.section].item[indexPath.row].name
        performSegue(withIdentifier: "showIt", sender: self)
    }
 
    //setting new automatic height of each row based on content
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Header
    //creating header view
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if( sections[section].name != ""){
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? TableHeaderView ?? TableHeaderView(reuseIdentifier: "header")
            
            header.titleLabel.text = sections[section].name
            
            header.arrowLabel.text = sections[section].item.count > 0 ? ">" : ""
            header.setCollapsed(sections[section].is_collapsed)
            
            header.section = section
            header.delegate = self
            return header
        }
        return nil
    }
    //height of header
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if( sections[section].name != ""){
            return 44.0
        }
        return 0.0
    }
    
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if( sections[section].name != ""){
            return 1.0
        }
        return 0.0
    }
    
    //toggling sections by calling delegate function , we set delagte in header view to self
    
    func toggleSection(_ header: TableHeaderView, section: Int) {
        let collapsed = !sections[section].is_collapsed
        
        // Toggle collapse
        sections[section].is_collapsed = collapsed
        header.setCollapsed(collapsed)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showIt"){
            let vc = segue.destination as! ViewController
            vc.setText = selectedText
        }
    }
}
