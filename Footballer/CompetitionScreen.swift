//
//  CompetitionScreen.swift
//  Footballer
//
//  Created by Khaled Elfakharany on 5/9/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit
import Alamofire

class CompetitionScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var competitionID :String!
    var competitionName :String!
    
    let table1 = UITableView()
    let table1View = UIView()
    let table2 = UITableView()
    let table2View = UIView()
    var matches = [Fixtures]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // This part of code is responsible for adding the Background image of Home Screen
        let backgroundImageView = UIImageView()
        let w = self.view.frame.width
        let h = self.view.frame.height
        backgroundImageView.frame = CGRect(x: 0*w,y: 0*h,width: 1*w,height: 1*h)
        backgroundImageView.image = UIImage(named: "CompetitionBackGround")
        self.view.addSubview(backgroundImageView)
        
        // This part of code is responsible for Dismissing the current ViewController
        let backBtn = UIButton()
        backBtn.frame = CGRect(x: 10, y: 10, width: 17, height: 45)
        let backBtnImage = UIImage(named: "Back")
        backBtn.setImage(backBtnImage, for: .normal)
        backBtn.addTarget(self, action: #selector(CompetitionScreen.back), for: UIControlEvents.touchUpInside)
        self.view.addSubview(backBtn)
        
        table1View.frame = CGRect(x: 37, y: 80, width: 340, height: 650)
        table1View.backgroundColor = UIColor.clear
        self.view.addSubview(table1View)
        
        table1.frame = CGRect(x: 0, y: 30, width: 340, height: 650)
        table1.register(tableTableViewCell.self, forCellReuseIdentifier: "table1Cell")
        table1.dataSource = self
        table1.delegate = self
        table1.backgroundColor = UIColor.clear
        self.table1View.addSubview(table1)
        
        // This part of code is responsible for adding the labels for the Table
        let labelsForTable = UIImageView()
        labelsForTable.frame = CGRect(x: 0, y: 0, width: 340, height: 20)
        labelsForTable.image = UIImage(named: "labelsTableView")
        self.table1View.addSubview(labelsForTable)

        
        
        table2View.frame = CGRect(x: 37, y: 70, width: 340, height: 500)
        table2View.backgroundColor = UIColor.clear
        self.view.addSubview(table2View)
        
        table2.frame = CGRect(x: 0, y: 0, width: 340, height: 650)
        table2.register(FixturesTableViewCell.self, forCellReuseIdentifier: "table2Cell")
        table2.dataSource = self
        table2.delegate = self
        table2.backgroundColor = UIColor.clear
        self.table2View.addSubview(table2)
        
        
        
        
        // This part of code is responsible for adding the UISegmentController
        let items = ["Table", "Fixtures", "Teams"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        customSC.frame = CGRect(x: 37, y: 23, width: 340, height: 20)
        customSC.layer.cornerRadius = 5.0
        customSC.tintColor = UIColor.orange
        customSC.addTarget(self, action: #selector(CompetitionScreen.changeSegment), for: .valueChanged)
        self.view.addSubview(customSC)
        
        
        // This part of code is responsible for adding the footer Image and Competition Image
        let footerImage = UIImageView()
        footerImage.frame = CGRect(x: 0, y: 646, width: 414, height: 90)
        footerImage.image = UIImage(named: "CompetitionFooter")
        self.view.addSubview(footerImage)
        let footerComepetitionImageBackGround = UIImageView()
        footerComepetitionImageBackGround.frame = CGRect(x: 137, y: 576, width: 140, height: 140)
        footerComepetitionImageBackGround.image = UIImage(named: "CompetitionFooterImage")
        self.view.addSubview(footerComepetitionImageBackGround)
        
        
        table2View.isHidden = true
        downloadMatchesData {
            self.table2.reloadData()
        }
        
        
    }
    
    func downloadMatchesData(completed: @escaping ()->()){
        let path = "https://apifootball.com/api/?action=get_events&from=2016-08-01&to=2017-06-01&league_id=\(competitionID!)&APIkey=56b3483d66c70a2d5af0ad5d83e3744460649b3c0635fdc74005f6159fb7144d"
        Alamofire.request(path).responseJSON{ response in
            let result = response.result
            if let array = result.value as? [Dictionary<String,String>] {
                for item in array {
                    let match = Fixtures(item: item)
                    self.matches.append(match)
                    print("score = \(match.awayTeamScore)")
                }
            }
            completed()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == table1 {
            return 30
        }
        if tableView == table2 {
            return matches.count
        }
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == table1 {
            if let cell = table1.dequeueReusableCell(withIdentifier: "table1Cell", for: indexPath) as? tableTableViewCell{
                cell.configureCell(cell: cell)
                print("haaaaa")
                return cell
            }
        }
        if tableView == table2 {
            if let cell = table2.dequeueReusableCell(withIdentifier: "table2Cell", for: indexPath) as? FixturesTableViewCell {
                cell.configureCell(cell: cell, match: matches[indexPath.section])
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == table1{
            return 46
        }
        if tableView == table2{
            return 83
        }
        return 40
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let FooterView = UIView()
        FooterView.backgroundColor = UIColor.clear
        return FooterView
    }
    
    
    func changeSegment(sender : UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            print("Fixtures")
            self.table1View.isHidden = true
            self.table2View.isHidden = false
            break
            
        case 2:
            print("Teams")
            self.table1View.isHidden = true
            self.table2View.isHidden = true
            break
            
        default:
            print("Table")
            self.table1View.isHidden = false
            self.table2View.isHidden = true
            break
        }
        
    }
    
    func back() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    //    var tableTableView: UITableView!
    //    var fixturesTableView: UITableView!
    //    let tableView = UIView()
    //    let fixturesView = UIView()
    //    let newView = UIView()
    //
    //    var matches = [Fixtures]()
    //
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        print(competitionName)
    //        print("compID=  \(competitionID!)")
    //
    //        // This part of code is responsible for adding the Background image of Home Screen
    //        let backgroundImageView = UIImageView()
    //        let w = self.view.frame.width
    //        let h = self.view.frame.height
    //        backgroundImageView.frame = CGRect(x: 0*w,y: 0*h,width: 1*w,height: 1*h)
    //        backgroundImageView.image = UIImage(named: "CompetitionBackGround")
    //        self.view.addSubview(backgroundImageView)
    //
    //        // This part of code is responsible for adding UIView for FixtureView
    //        newView.frame = CGRect(x: 37, y: 50, width: 340, height: 83)
    //        newView.backgroundColor = UIColor.clear
    //        self.view.addSubview(iew)
    //
    //
    //        // This part of code is responsible for adding TableView for fixturesView
    //        fixturesTableView = UITableView(frame: CGRect(x: 0, y: 0, width: 340, height: 650) )
    //        fixturesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
    //        fixturesTableView.delegate = self
    //        fixturesTableView.dataSource = self
    //        fixturesTableView.backgroundColor = UIColor.clear
    //        fixturesTableView.separatorColor = UIColor.clear
    //        fixturesTableView.allowsSelection = false
    //        fixturesView.addSubview(fixturesTableView)
    //
    //        // This part of code is responsible for adding UIView for TableView
    //        tableView.frame = CGRect(x: 37, y: 80, width: 340, height: 650)
    //        tableView.backgroundColor = UIColor.clear
    //        self.view.addSubview(tableView)
    //
    //        // This part of code is responsible for adding TableView for tableView
    //        tableTableView = UITableView(frame: CGRect(x: 0, y: 30, width: 340, height: 650))
    //        tableTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
    //        tableTableView.delegate = self
    //        tableTableView.dataSource = self
    //        tableTableView.backgroundColor = UIColor.clear
    //        tableTableView.separatorColor = UIColor.clear
    //        tableTableView.allowsSelection = false
    //        tableView.addSubview(tableTableView)
    //
    //        // This part of code is responsible for adding the labels for the Table
    //        let labelsForTable = UIImageView()
    //        labelsForTable.frame = CGRect(x: 0, y: 0, width: 340, height: 20)
    //        labelsForTable.image = UIImage(named: "labelsTableView")
    //        self.tableView.addSubview(labelsForTable)
    //
    //
    //
    //        // This part of code is responsible for adding the footer Image and Competition Image
    //        let footerImage = UIImageView()
    //        footerImage.frame = CGRect(x: 0, y: 646, width: 414, height: 90)
    //        footerImage.image = UIImage(named: "CompetitionFooter")
    //        self.view.addSubview(footerImage)
    //        let footerComepetitionImageBackGround = UIImageView()
    //        footerComepetitionImageBackGround.frame = CGRect(x: 137, y: 576, width: 140, height: 140)
    //        footerComepetitionImageBackGround.image = UIImage(named: "CompetitionFooterImage")
    //        self.view.addSubview(footerComepetitionImageBackGround)
    //
    //        // This part of code is responsible for Dismissing the current ViewController
    //        let backBtn = UIButton()
    //        backBtn.frame = CGRect(x: 10, y: 10, width: 17, height: 45)
    //        let backBtnImage = UIImage(named: "Back")
    //        backBtn.setImage(backBtnImage, for: .normal)
    //        backBtn.addTarget(self, action: #selector(CompetitionScreen.back), for: UIControlEvents.touchUpInside)
    //        self.view.addSubview(backBtn)
    //
    //        // This part of code is responsible for adding the UISegmentController
    //        let items = ["Table", "Fixtures", "Teams"]
    //        let customSC = UISegmentedControl(items: items)
    //        customSC.selectedSegmentIndex = 0
    //        customSC.frame = CGRect(x: 37, y: 23, width: 340, height: 20)
    //        customSC.layer.cornerRadius = 5.0
    //        customSC.tintColor = UIColor.orange
    //        customSC.addTarget(self, action: #selector(CompetitionScreen.changeSegment), for: .valueChanged)
    //        self.view.addSubview(customSC)
    //
    //        fixturesView.isHidden = true
    //        tableView.isHidden = false
    //        downloadMatchesData {
    //            print("array count = \(self.matches.count)")
    //            self.fixturesTableView.reloadData()
    //        }
    //
    //    }
    //
    //
    //    func downloadMatchesData(completed: @escaping ()->()){
    //        let path = "https://apifootball.com/api/?action=get_events&from=2016-08-01&to=2017-06-01&league_id=\(competitionID!)&APIkey=56b3483d66c70a2d5af0ad5d83e3744460649b3c0635fdc74005f6159fb7144d"
    //        Alamofire.request(path).responseJSON{ response in
    //            let result = response.result
    //            if let array = result.value as? [Dictionary<String,String>] {
    //                for item in array {
    //                    let match = Fixtures(item: item)
    //                    self.matches.append(match)
    //                }
    //            }
    //            completed()
    //        }
    //
    //    }
    //
    //
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        if tableView == tableTableView {
    //            return 20
    //        }
    //        else if tableView == fixturesTableView{
    //            print(matches.count)
    //            return matches.count
    //        }
    //        return 30
    //    }
    //
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        if tableView == tableTableView {
    //            return 1
    //        }
    //        else if tableView == fixturesTableView {
    //            return 1
    //        }
    //        return 1
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        if tableView == tableTableView {
    //            if let cell = tableTableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? tableTableViewCell{
    //                cell.configureCell(cell: cell)
    //                return cell
    //            }
    //        }
    //        if tableView == fixturesTableView {
    //            if let cell = fixturesTableView.dequeueReusableCell(withIdentifier: "FixturesCell", for: indexPath) as? FixturesTableViewCell {
    //                cell.configureCell(cell: cell, match: matches[indexPath.section])
    //                return cell
    //            }
    //        }
    //
    //
    //        return UITableViewCell()
    //    }
    //
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        if tableView == tableTableView {
    //            return 46
    //        }
    //        else if tableView == fixturesTableView {
    //            return 83
    //        }
    //        return 40
    //    }
    //
    //
    //    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    //        return 5
    //    }
    //
    //
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //        let FooterView = UIView()
    //        FooterView.backgroundColor = UIColor.clear
    //        return FooterView
    //    }
    //
    //
    //    func back() {
    //        dismiss(animated: true, completion: nil)
    //    }
    //    func changeSegment(sender : UISegmentedControl) {
    //        switch sender.selectedSegmentIndex {
    //        case 1:
    //            print("Fixtures")
    //            self.tableView.isHidden = true
    //            self.fixturesView.isHidden = false
    //            break
    //            
    //        case 2:
    //            print("Teams")
    //            self.tableView.isHidden = true
    //            self.fixturesView.isHidden = true
    //            break
    //            
    //        default:
    //            print("Table")
    //            self.tableView.isHidden = false
    //            self.fixturesView.isHidden = true
    //            break
    //        }
    //    }
    
    
    
    
    
    
}
