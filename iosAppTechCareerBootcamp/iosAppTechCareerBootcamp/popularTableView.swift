//
//  popularTableView.swift
//  iosAppTechCareerBootcamp
//
//  Created by Elıf on 24.08.2022.
//

import UIKit

class popularTableView: UITableViewCell {

    @IBOutlet var popularCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension popularTableView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularDataList[popularCollectionView.tag].productImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! popularCollectionView
        cell.popularImage.image = UIImage(named: popularDataList[popularCollectionView.tag].productImage[indexPath.row])
        cell.popularLabel.text = popularDataList[popularCollectionView.tag].productName[indexPath.row]
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.clear.cgColor
        return cell
    }
}
