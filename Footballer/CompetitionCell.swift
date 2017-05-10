//
//  CompetitionCell.swift
//  Footballer
//
//  Created by Khaled Elfakharany on 5/9/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class CompetitionCell: UICollectionViewCell {
    let imageHolder = UIImageView()
    let image = UIImageView()
    
    
    func configureCell(cell : UICollectionViewCell, competition : Competition)  {
        imageHolder.frame = CGRect(x: 0, y: 0, width: 178 , height: 178)
        imageHolder.image = UIImage(named: "imageHolderHome")
        cell.contentView.addSubview(imageHolder)
        image.frame = CGRect(x: 10, y: 10, width: 150, height: 150)
        image.image = UIImage(named: competition.competitionName)
        image.contentMode = UIViewContentMode.scaleAspectFit
        cell.contentView.addSubview(image)
        
    }
}

