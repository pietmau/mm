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
    private let space:CGFloat = 3
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    @IBAction func onAddClicked(_ sender: Any) {
        let controller: ViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        present(controller, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        layout.itemSize = getSize()
    }
    
    private func getSize()->CGSize{
        let orientation = UIDevice.current.orientation
        switch orientation {
        case .portrait,
             .portraitUpsideDown:
            return getVerticalSize()
        case .landscapeLeft,
             .landscapeRight:
            return getHorizontalSize()
        default:
            return getVerticalSize()
        }
        
    }
    
    private func getVerticalSize()->CGSize{
        let size = (self.view.frame.size.width - (2 * space)) / 3.0
        return CGSize(width: size, height: size)
    }
    
    private func getHorizontalSize()->CGSize{
        let size = (self.view.frame.size.height - (4 * space)) / 5.0
        return CGSize(width: size, height: size)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getMemes().count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.image.image = getMemes()[indexPath.row].memedImage
        // Configure the cell
        
        return cell
    }
    
    private func getMemes()->[Meme]{
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
