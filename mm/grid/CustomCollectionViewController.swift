//
//  CustomCollectionViewController.swift
//  mm
//
//  Created by Maurizio Pietrantuono on 13/11/2017.
//  Copyright © 2017 Maurizio Pietrantuono. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CustomCollectionViewController: UICollectionViewController {
    
    @IBAction func onAddClicked(_ sender: Any) {
        let controller: ViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        present(controller, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return getMemes().count
    }
    
    private func getMemes()->[Meme]{
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}
