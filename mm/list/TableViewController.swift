//
//  TableViewController.swift
//  mm
//
//  Created by Maurizio Pietrantuono on 06/11/2017.
//  Copyright © 2017 Maurizio Pietrantuono. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return (UIApplication.shared.delegate as! AppDelegate).memes.count
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListElement", for: indexPath)
        if let top = cell.viewWithTag(2) as! UILabel!{
            top.text = "ggg"
        }
        if let bottom = cell.viewWithTag(3) as! UILabel!{
            bottom.text = "ff"
        }
        if let imageView = cell.viewWithTag(1) as! UIImageView!{
            imageView.image = #imageLiteral(resourceName: "icons8-plus-math-filled")
        }
        return cell
    }

    private func getMemes()->[Meme]{
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
}
