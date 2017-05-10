//
//  tableTableViewCell.swift
//  Footballer
//
//  Created by Khaled Elfakharany on 5/10/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class tableTableViewCell: UITableViewCell {
    
    let backgroundImage = UIImageView()
    let teamLogo = UIImageView()
    
    let teamPosition = UILabel()
    let teamName = UILabel()
    let played = UILabel()
    let win = UILabel()
    let draw = UILabel()
    let lose = UILabel()
    let goalsScored = UILabel()
    let goalsAgainst = UILabel()
    let goalsDifference = UILabel()
    let points = UILabel()
    
    func configureCell(cell: UITableViewCell){
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 340, height: 46)
        backgroundImage.image = UIImage(named: "tableCellBackground")
        
        teamLogo.frame = CGRect(x: 40, y: 13, width: 35, height: 30)
        teamLogo.image = UIImage(named: "Chelsea")
        teamLogo.contentMode = UIViewContentMode.scaleAspectFit
        
        teamPosition.frame = CGRect(x: 0, y: 15, width: 35, height: 16)
        teamName.frame = CGRect(x: 22, y: 0, width: 71, height: 11)
        played.frame = CGRect(x: 123, y: 16, width: 21, height: 14)
        win.frame = CGRect(x: 151, y: 16, width: 21, height: 14)
        draw.frame = CGRect(x: 179, y: 16, width: 21, height: 14)
        lose.frame = CGRect(x: 207, y: 16, width: 21, height: 14)
        goalsScored.frame = CGRect(x: 235, y: 16, width: 21, height: 14)
        goalsAgainst.frame = CGRect(x: 263, y: 16, width: 21, height: 14)
        goalsDifference.frame = CGRect(x: 291, y: 16, width: 21, height: 14)
        points.frame = CGRect(x: 319, y: 16, width: 21, height: 14)
        
        teamPosition.text = "1"
        teamName.text = "Chelsea"
        played.text = "100"
        win.text = "100"
        draw.text = "100"
        lose.text = "100"
        goalsScored.text = "100"
        goalsAgainst.text = "100"
        goalsDifference.text = "100"
        points.text = "100"
        
        teamPosition.textColor = UIColor.white
        teamName.textColor = UIColor.white
        played.textColor = UIColor.white
        win.textColor = UIColor.white
        draw.textColor = UIColor.white
        lose.textColor = UIColor.white
        goalsScored.textColor = UIColor.white
        goalsAgainst.textColor = UIColor.white
        goalsDifference.textColor = UIColor.white
        points.textColor = UIColor.white
        
        teamPosition.textAlignment = NSTextAlignment.center
        teamName.textAlignment = NSTextAlignment.center
        played.textAlignment = NSTextAlignment.center
        win.textAlignment = NSTextAlignment.center
        draw.textAlignment = NSTextAlignment.center
        lose.textAlignment = NSTextAlignment.center
        goalsScored.textAlignment = NSTextAlignment.center
        goalsAgainst.textAlignment = NSTextAlignment.center
        goalsDifference.textAlignment = NSTextAlignment.center
        points.textAlignment = NSTextAlignment.center
        
        teamPosition.font = UIFont(name: "Avenir", size: 12)
        teamName.font = UIFont(name: "Avenir", size: 9)
        played.font = UIFont(name: "Avenir", size: 10)
        win.font = UIFont(name: "Avenir", size: 10)
        draw.font = UIFont(name: "Avenir", size: 10)
        lose.font = UIFont(name: "Avenir", size: 10)
        goalsScored.font = UIFont(name: "Avenir", size: 10)
        goalsAgainst.font = UIFont(name: "Avenir", size: 10)
        goalsDifference.font = UIFont(name: "Avenir", size: 10)
        points.font = UIFont(name: "Avenir", size: 10)
        
        
        cell.addSubview(backgroundImage)
        cell.addSubview(teamLogo)
        cell.addSubview(teamPosition)
        cell.addSubview(teamName)
        cell.addSubview(played)
        cell.addSubview(win)
        cell.addSubview(draw)
        cell.addSubview(lose)
        cell.addSubview(goalsScored)
        cell.addSubview(goalsAgainst)
        cell.addSubview(goalsDifference)
        cell.addSubview(points)
        
        cell.backgroundColor = UIColor.clear
    }
    
    
}
