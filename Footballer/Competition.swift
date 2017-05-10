//
//  Competition.swift
//  Footballer
//
//  Created by Khaled Elfakharany on 5/9/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import Foundation

class Competition {
    private var _competitionName: String!
    private var _competitionId: String!
    
    var competitionName : String {
        return _competitionName
    }
    var competitionId : String {
        return _competitionId
    }
    init(item : Dictionary<String,String> ) {
        if let leagueName = item["league_name"] {
            _competitionName = leagueName
        }
        if let leagueID = item["league_id"] {
            _competitionId = leagueID
        }
    }
    
}
