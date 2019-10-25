//
//  BaseViewController.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

class BaseViewController<T>: UIViewController, RoutableScreen {
    var context: RouteContext?
    var presenter: T?
    var router: Router {
        return Router(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initPresenter(with: context)
    }

    func initPresenter(with context: RouteContext?) {
        fatalError("Subclasses must implement initPresenter()")
    }
}

extension BaseViewController: BaseView {
    func openScreen(_ screen: Constants.Scenes, fromStoryboard storyboard: Constants.Storyboards, withContext context: RouteContext? = nil) {
        let router = Router(viewController: self)
        router.openScreen(screen, fromStoryboard: storyboard, isChildScreen: false, withContext: context)
    }

    func openChildScreen(_ screen: Constants.Scenes, fromStoryboard storyboard: Constants.Storyboards, withContext context: RouteContext? = nil) {
        let router = Router(viewController: self)
        router.openScreen(screen, fromStoryboard: storyboard, isChildScreen: true, withContext: context)
    }

    func backToPrevScreen(with context: RouteContext? = nil) {
        let router = Router(viewController: self)
        router.backToPreviousScreen(with: context)
    }
}
