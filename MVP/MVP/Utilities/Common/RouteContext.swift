//
//  RouteContext.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

protocol RoutableScreen {
    var context: RouteContext? { get set }
}

struct RouteContext {
    private let parameters: [String: Any]

    init(with parameters: [String: Any]) {
        self.parameters = parameters
    }

    subscript<T>(key: String) -> T? {
        return parameters[key] as? T
    }
}
