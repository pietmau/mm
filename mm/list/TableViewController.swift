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
    @IBAction func onAddClicked(_ sender: Any) {
        let controller: ViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getMemes().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListElement", for: indexPath)
        let meme = getMemes()[indexPath.row]
        if let top = cell.viewWithTag(2) as! UILabel!{
            top.text = meme.topText
        }
        if let bottom = cell.viewWithTag(3) as! UILabel!{
            bottom.text = meme.bottomText
        }
        if let imageView = cell.viewWithTag(1) as! UIImageView!{
            imageView.image = meme.memedImage
        }
        return cell
    }

    private func getMemes()->[Meme]{
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
}
