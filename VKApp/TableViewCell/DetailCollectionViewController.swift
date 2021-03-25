//
//  DetailCollectionViewController.swift
//  VKApp
//
//  Created by Artur Gedakyan on 18.03.2021.
//

import UIKit

private let reuseIdentifier = "detailCell"

class DetailCollectionViewController: UICollectionViewController {

    var qunemGandon: Users? = nil
    
    var qunemModel = [Users]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qunemModel.append(qunemGandon ?? Users(name: "", userImage: ""))
       
        collectionView.delegate = self
        collectionView.dataSource = self
        
    
//        collectionView.register(PodrobnoCollectionViewCell.nib(), forCellWithReuseIdentifier: PodrobnoCollectionViewCell.id)

        // Do any additional setup after loading the view.
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        qunemModel.count
    }

//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PodrobnoCollectionViewCell.id, for: indexPath) as? PodrobnoCollectionViewCell else { return UICollectionViewCell() }
//        
//        cell.configure(model: qunemModel[indexPath.row])
//        return cell
//    }

}
