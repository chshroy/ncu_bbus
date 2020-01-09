//
//  Route.swift
//  bus
//
//  Created by royyaha on 19.12.19.
//  Copyright © 2019 royyaha. All rights reserved.
//

import Foundation

struct Route: Identifiable, Equatable {
    var id = UUID()
    var uid: String
    var direction: Int  // 去返程[0:'去程',1:'返程',2:'迴圈',255:'未知'].
    var stops: [Stops]
    var name: [String : String]
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.uid == rhs.uid && lhs.direction == rhs.direction && lhs.name == rhs.name
    }
    
    #if DEBUG
    static let example: Route = Route(uid: "UID", direction: 0, stops: [Stops.example, Stops.example], name: ["en":"132","zh_tw":"132"])
    #endif
    
}
