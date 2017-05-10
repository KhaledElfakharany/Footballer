//
//  CompetitionsScreen.swift
//  Footballer
//
//  Created by Khaled Elfakharany on 5/9/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit
import Alamofire

class CompetitionsScreen: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    var collectionView: UICollectionView!
    var competitions = [Competition]()
    var indecator = UIActivityIndicatorView()
    var countryId :String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(countryId)
        
        // This part of code is responsible for adding the Background image of Home Screen
        let backgroundImageView = UIImageView()
        let w = self.view.frame.width
        let h = self.view.frame.height
        backgroundImageView.frame = CGRect(x: 0*w,y: 0*h,width: 1*w,height: 1*h)
        backgroundImageView.image = UIImage(named: "HomeBackGround")
        self.view.addSubview(backgroundImageView)
        
        // This part of code is responsible for adding loading animation
        let loadingBackGroundView = UIImageView()
        loadingBackGroundView.frame = CGRect(x: 182, y: 343, width: 50, height: 50)
        loadingBackGroundView.image = UIImage(named: "LoadingBackGround")
        self.view.addSubview(loadingBackGroundView)
        indecator.frame = CGRect(x: 182, y: 343, width: 50, height: 50)
        indecator.color = UIColor.orange
        self.view.addSubview(indecator)
        indecator.startAnimating()
        
        // This part of code is responsible for Dismissing the current ViewController
        let backBtn = UIButton()
        backBtn.frame = CGRect(x: 10, y: 10, width: 17, height: 45)
        let backBtnImage = UIImage(named: "Back")
        backBtn.setImage(backBtnImage, for: .normal)
        backBtn.addTarget(self, action: #selector(CompetitionsScreen.back), for: UIControlEvents.touchUpInside)
        self.view.addSubview(backBtn)
        
        // this part of code is responsible for adding the Collection view of the home screen
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 178 , height: 178)
        layout.minimumInteritemSpacing = CGFloat(18)
        collectionView = UICollectionView(frame: CGRect(x: 20, y: 50, width: 374, height: 676) , collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CompetitionCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.clear
        self.view.addSubview(collectionView)
        
        // this part of code is responsible for calling the download function right after loading the view and refresh the collectionView
        collectionView.isHidden = true
        downloadCompetitionsData{
            print(self.competitions.count)
            if self.competitions.count > 0 {
                self.collectionView.reloadData()
                self.collectionView.isHidden = false
                self.indecator.stopAnimating()
                loadingBackGroundView.isHidden = true
            }
        }
    }
    
    func downloadCompetitionsData(completed: @escaping ()->()){
        let path = "https://apifootball.com/api/?action=get_leagues&country_id=\(countryId!)&APIkey=56b3483d66c70a2d5af0ad5d83e3744460649b3c0635fdc74005f6159fb7144d"
        Alamofire.request(path).responseJSON{ response in
            let result = response.result
            if let array = result.value as? [Dictionary<String,String>] {
                for item in array {
                    let competition = Competition(item: item)
                    self.competitions.append(competition)
                }
            }
            completed()
        }
        
    }
    
    // This part of code is responsible for controlling the Collection View, inherting from its protocols
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return competitions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as? CompetitionCell{
            cell.configureCell(cell: cell, competition: competitions[indexPath.row])
            return cell
        }
        return HomeScreenCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let competition = competitions[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompetitionScreen") as! CompetitionScreen
        vc.competitionID = competition.competitionId
        vc.competitionName = competition.competitionName
        present(vc, animated: true, completion: nil)
    }
    
    func back() {
        dismiss(animated: true, completion: nil)
    }


}
