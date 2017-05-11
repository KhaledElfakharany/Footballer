//
//  FixturesTableViewCell.swift
//  Footballer
//
//  Created by Khaled Elfakharany on 5/11/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class FixturesTableViewCell: UITableViewCell {

    let backgroundImage = UIImageView()
    let homeTeamLogo = UIImageView()
    let awayTeamLogo = UIImageView()
    
    
    let hometeamLbl = UILabel()
    let awayTeamLbl = UILabel()
    let homeTeamScore = UILabel()
    let awayTeamScore = UILabel()
    let matchDate = UILabel()
    let matchTime = UILabel()
    let scoreSeparator = UILabel()
    
    func configureCell(cell: UITableViewCell, match : Fixtures){
        backgroundImage.frame = CGRect(x: 0, y: 0, width: 340, height: 83)
        backgroundImage.image = UIImage(named: "fixturesCellBackground")
        cell.addSubview(backgroundImage)
        
        homeTeamLogo.frame = CGRect(x: 66, y: 8, width: 50, height: 50)
        homeTeamLogo.image = UIImage(named: match.homeTeamName)
        homeTeamLogo.contentMode = UIViewContentMode.scaleAspectFit
        cell.addSubview(homeTeamLogo)
        
        awayTeamLogo.frame = CGRect(x: 226, y: 8, width: 50, height: 50)
        awayTeamLogo.image = UIImage(named: match.awayTeamName)
        awayTeamLogo.contentMode = UIViewContentMode.scaleAspectFit
        cell.addSubview(awayTeamLogo)
        
        hometeamLbl.frame = CGRect(x: 36, y: 61, width: 110, height: 14)
        hometeamLbl.text = match.homeTeamName
        hometeamLbl.textColor = UIColor.white
        hometeamLbl.textAlignment = NSTextAlignment.center
        hometeamLbl.font = UIFont(name: "Avenir-Black", size: 9)
        cell.addSubview(hometeamLbl)
        
        
        awayTeamLbl.frame = CGRect(x: 196, y: 61, width: 110, height: 14)
        awayTeamLbl.text = match.awayTeamName
        awayTeamLbl.textColor = UIColor.white
        awayTeamLbl.textAlignment = NSTextAlignment.center
        awayTeamLbl.font = UIFont(name: "Avenir-Black", size: 9)
        cell.addSubview(awayTeamLbl)
        
        homeTeamScore.frame = CGRect(x: 136, y: 20, width: 12, height: 27)
        homeTeamScore.text = match.homeTeamScore
        homeTeamScore.textColor = UIColor.white
        homeTeamScore.textAlignment = NSTextAlignment.center
        homeTeamScore.font = UIFont(name: "Avenir-Black", size: 12)
        cell.addSubview(homeTeamScore)
        
        awayTeamScore.frame = CGRect(x: 194, y: 20, width: 12, height: 27)
        awayTeamScore.text = match.awayTeamScore
        awayTeamScore.textColor = UIColor.white
        awayTeamScore.textAlignment = NSTextAlignment.center
        awayTeamScore.font = UIFont(name: "Avenir-Black", size: 12)
        cell.addSubview(awayTeamScore)
        
        matchDate.frame = CGRect(x: 139, y: 45, width: 64, height: 14)
        matchDate.text = match.matchDate
        matchDate.textColor = UIColor.white
        matchDate.textAlignment = NSTextAlignment.center
        matchDate.font = UIFont(name: "Avenir-Black", size: 12)
        cell.addSubview(matchDate)
        
        matchTime.frame = CGRect(x: 153, y: 58, width: 37, height: 14)
        matchTime.text = match.matchTime
        matchTime.textColor = UIColor.white
        matchTime.textAlignment = NSTextAlignment.center
        matchTime.font = UIFont(name: "Avenir-Black", size: 12)
        cell.addSubview(matchTime)
        
        scoreSeparator.frame = CGRect(x: 168, y: 20, width: 6, height: 27)
        scoreSeparator.text = "-"
        scoreSeparator.textColor = UIColor.white
        scoreSeparator.textAlignment = NSTextAlignment.center
        scoreSeparator.font = UIFont(name: "Avenir-Black", size: 18)
        cell.addSubview(scoreSeparator)
        
        cell.backgroundColor = UIColor.clear
    }

}
