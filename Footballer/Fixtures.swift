//
//  Fixtures.swift
//  Footballer
//
//  Created by Khaled Elfakharany on 5/11/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import Foundation

class Fixtures {
    
    private var _matchId: String!
    private var _matchDate: String!
    private var _matchTime: String!
    private var _homeTeamName: String!
    private var _awayTeamName: String!
    private var _homeTeamScore: String!
    private var _awayTeamScore: String!
    
    var matchid : String {
        return _matchId
    }
    
    var matchDate : String {
        return _matchDate
    }
    
    var matchTime : String {
        return _matchTime
    }
    
    var homeTeamName : String {
        return _homeTeamName
    }
    
    var awayTeamName : String {
        return _awayTeamName
    }
    
    var homeTeamScore : String {
        return _homeTeamScore
    }
    
    var awayTeamScore : String {
        return _awayTeamScore
    }
    
    init(item: Dictionary<String,String>) {
        if let matchid = item["match_id"] {
            _matchId = matchid
        }
        if let matchTime = item["match_time"] {
            _matchTime = matchTime
        }
        if let matchDate = item["match_date"] {
            _matchDate = matchDate
        }
        if let homeTeamName = item["match_hometeam_name"] {
            _homeTeamName = homeTeamName
        }
        if let awayTeamName = item["match_awayteam_name"] {
            _awayTeamName = awayTeamName
        }
        if let homeTeamScore = item["match_hometeam_score"] {
            _homeTeamScore = homeTeamScore
        }
        if let awayTeamScore = item["match_awayteam_score"] {
            _awayTeamScore = awayTeamScore
        }
    }
    
    
    
}
