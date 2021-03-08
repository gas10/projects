//
//  SoccerGameModel.swift
//  SoccerStar
//
//  Created by Amar Gawade on 3/8/21.
//

import Foundation
class SoccerGameModel {
    let team: String
    let vsTeam: String
    let date: Date
    let league: String
    
    init(team: String, vsTeam: String, date: Date, league: String) {
        self.team = team
        self.vsTeam = vsTeam
        self.date = date
        self.league = league
    }
    public static let soccerGames: [SoccerGameModel] = [
        SoccerGameModel(team: "FC Barcelona", vsTeam: "FC Liverpool", date: NSDate() as Date, league: "Champions"),
        SoccerGameModel(team: "Real Madrid", vsTeam: "FC Chelsea", date: NSDate() as Date, league: "EPL"),
        SoccerGameModel(team: "Arsenal", vsTeam: "Manchester City", date: NSDate() as Date, league: "EPL"),
        SoccerGameModel(team: "Leeds United", vsTeam: "Norwich City", date: NSDate() as Date, league: "EPL"),
        SoccerGameModel(team: "FC Barcelona", vsTeam: "Real Madrid", date: NSDate() as Date, league: "LaLiga"),
        SoccerGameModel(team: "FC Barcelona", vsTeam: "Sevilla FC", date: NSDate() as Date, league: "LaLiga"),
        SoccerGameModel(team: "PSG", vsTeam: "AC Roma", date: NSDate() as Date, league: "League 1")
    ]
}

