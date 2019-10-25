//
//  BasePresenter.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import Foundation

class BasePresenter<T> {
    var view: T?
    var context: RouteContext?

    func attachView(view: T) {
        self.view = view
    }

    func setContext(to context: RouteContext?) {
        self.context = context
    }

    func detachView() {
        view = nil
    }
}
