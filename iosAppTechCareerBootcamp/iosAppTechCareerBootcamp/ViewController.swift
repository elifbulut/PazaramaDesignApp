//
//  ViewController.swift
//  iosAppTechCareerBootcamp
//
//  Created by Elıf on 20.08.2022.
//

import UIKit

let popularDataList =
[
    popularData(sectionType: "    ",
                productImage: ["samsung","mavi","huawei","beinconnect","watsons","nivea"],
                productName: ["Samsung","Mavi","Huawei","BeinConnect","Watsons","Nivea"]),

    popularData(sectionType: "    ",
             productImage: ["gurbuzler","kadinlarinelinden","celebiogullari","hataydagzeytini","imamcagdas","dilekgurme"],
             productName: ["Gürbüzler","Kadınların Elinden","ÇelebiOğulları","HatayZeytin","İmamÇağdaş","DilekGurme"])
]

var imagesSlider:[String] = ["slider1","slider2","slider3","slider4"]

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesSlider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "toSliderCell", for: indexPath) as! sliderCell
        cell.sliderImage.image = UIImage(named: imagesSlider[indexPath.row])
        cell.sliderImage.layer.cornerRadius = 10
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        sliderControl.currentPage = indexPath.row
    }
    
    @IBOutlet var notification: UIBarButtonItem!
    @IBOutlet var TableView: UITableView!
    @IBOutlet var sliderControl: UIPageControl!
    @IBOutlet var scroll: UIScrollView!
    @IBOutlet var secondView: UIView!
    
    //var currentPage:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sliderControl.currentPage = 0
        sliderControl.numberOfPages = imagesSlider.count
        //navigationbar design
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "companyPink")
        appearance.shadowColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        //search bar design
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.searchTextField.leftView?.tintColor = UIColor(named: "companyPink")
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "Marka, ürün, hizmet ara..."
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! popularTableView
        cell.popularCollectionView.tag = indexPath.section
        cell.popularCollectionView.reloadData()
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return popularDataList.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return popularDataList[section].sectionType
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
}
