//
//  CompetitionScreen.swift
//  Footballer
//
//  Created by Khaled Elfakharany on 5/9/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class CompetitionScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var competitionID :String!
    var competitionName :String!
    var tableTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(competitionName)
        
        // This part of code is responsible for adding the Background image of Home Screen
        let backgroundImageView = UIImageView()
        let w = self.view.frame.width
        let h = self.view.frame.height
        backgroundImageView.frame = CGRect(x: 0*w,y: 0*h,width: 1*w,height: 1*h)
        backgroundImageView.image = UIImage(named: "CompetitionBackGround")
        self.view.addSubview(backgroundImageView)
        
        // This part of code is responsible for adding the labels for the Table
        let labelsForTable = UIImageView()
        labelsForTable.frame = CGRect(x: 37, y: 50, width: 340, height: 20)
        labelsForTable.image = UIImage(named: "labelsTableView")
        self.view.addSubview(labelsForTable)
        
        // This part of code is responsible for adding tableView
        tableTableView = UITableView(frame: CGRect(x: 37, y: 80, width: 340, height: 650))
        tableTableView.register(tableTableViewCell.self, forCellReuseIdentifier: "TableCell")
        tableTableView.delegate = self
        tableTableView.dataSource = self
        tableTableView.backgroundColor = UIColor.clear
        tableTableView.separatorColor = UIColor.clear
        tableTableView.allowsSelection = false
        
        self.view.addSubview(tableTableView)
        
        // This part of code is responsible for adding the footer Image and Competition Image
        let footerImage = UIImageView()
        footerImage.frame = CGRect(x: 0, y: 646, width: 414, height: 90)
        footerImage.image = UIImage(named: "CompetitionFooter")
        self.view.addSubview(footerImage)
        let footerComepetitionImageBackGround = UIImageView()
        footerComepetitionImageBackGround.frame = CGRect(x: 137, y: 576, width: 140, height: 140)
        footerComepetitionImageBackGround.image = UIImage(named: "CompetitionFooterImage")
        self.view.addSubview(footerComepetitionImageBackGround)
        
        // This part of code is responsible for Dismissing the current ViewController
        let backBtn = UIButton()
        backBtn.frame = CGRect(x: 10, y: 10, width: 17, height: 45)
        let backBtnImage = UIImage(named: "Back")
        backBtn.setImage(backBtnImage, for: .normal)
        backBtn.addTarget(self, action: #selector(CompetitionScreen.back), for: UIControlEvents.touchUpInside)
        self.view.addSubview(backBtn)
        
        // This part of code is responsible for adding the UISegmentController 
        let items = ["Table", "Fixtures", "Teams"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        customSC.frame = CGRect(x: 37, y: 23, width: 340, height: 20)
        customSC.layer.cornerRadius = 5.0
        customSC.tintColor = UIColor.orange
        customSC.addTarget(self, action: #selector(CompetitionScreen.changeSegment), for: .valueChanged)
        self.view.addSubview(customSC)
        
        
        
        
        

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableTableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? tableTableViewCell{
        cell.configureCell(cell: cell)
        return cell
        }
        return tableTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let FooterView = UIView()
        FooterView.backgroundColor = UIColor.clear
        return FooterView
    }
    
    
    func back() {
        dismiss(animated: true, completion: nil)
    }
    func changeSegment(sender : UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            print("Fixtures")
            break
            
        case 2:
            print("Teams")
            break
            
        default:
            print("Table")
            break
        }
    }
    
    
    
    


}
