//
//  Country.swift
//  Footballer
//
//  Created by Khaled Elfakharany on 5/9/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import Foundation

class Country {
    private var _countryName: String!
    private var _countryId: String!
    
    var countryName : String {
        return _countryName
    }
    var countryId : String {
        return _countryId
    }
    init(name : String, ID : String ) {
        _countryId = ID
        _countryName = name
    }
}
