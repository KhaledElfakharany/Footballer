//
//  HomeScreenCollectionViewCell.swift
//  Footballer
//
//  Created by Khaled Elfakharany on 5/9/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class HomeScreenCollectionViewCell: UICollectionViewCell {
    let imageHolder = UIImageView()
    let image = UIImageView()

    
    func configureCell(cell : UICollectionViewCell, country : Country)  {
        imageHolder.frame = CGRect(x: 0, y: 0, width: 178 , height: 178)
        imageHolder.image = UIImage(named: "imageHolderHome")
        cell.contentView.addSubview(imageHolder)
        image.frame = CGRect(x: 10, y: 10, width: 150, height: 150)
        image.image = UIImage(named: country.countryName)
        image.contentMode = UIViewContentMode.scaleAspectFit
        cell.contentView.addSubview(image)
        
    }
    
}
