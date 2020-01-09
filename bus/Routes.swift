//
//  FavoriteRoute.swift
//  bus
//
//  Created by royyaha on 28.12.19.
//  Copyright © 2019 royyaha. All rights reserved.
//

import Foundation
import SwiftUI

class FavoriteRoutes: ObservableObject {
    @Published var routes = [Route.example, Route.example]

    func add(item: Route) {
        routes.append(item)
    }

}

class AllRoutes: ObservableObject {
    @Published var routes = [Route.example, Route.example]

    func add(item: Route) {
        routes.append(item)
    }

}
