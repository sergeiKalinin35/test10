//
//  ViewController.swift
//  test10
//
//  Created by Sergey on 03.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var movia = [APIMovie]()
    var cast = [Cast]()
    
    @IBOutlet var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchDataMovie { casttt in
            self.cast = casttt.cast
            self.collectionView.reloadData()
        }
    }
    
    
    


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cast.count
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let casts = cast[indexPath.row]
        cell.configure(with: casts)
     
        
        return cell
    }
    
    
    
    
    
}
