//
//  BasePresenter.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import Foundation

class BasePresenter
//<T>
{
//    var mvpView: T?
    var context: RouteContext?

//    func attachView(mvpView: T) {
//        self.mvpView = mvpView
//    }

    func setContext(to context: RouteContext?) {
        self.context = context
    }

//    func detachView() {
//        mvpView = nil
//    }
}
