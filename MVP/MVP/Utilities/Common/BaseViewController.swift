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
        setupStyle()
        initPresenter(with: context)
    }

    func initPresenter(with context: RouteContext?) {
        fatalError("Subclasses must implement initPresenter()")
    }

    func setupStyle() {
        setNeedsStatusBarAppearanceUpdate()
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}

//extension BaseVC: MvpView {
//    func openScreen(_ screen: Constants.Scenes,
//                    fromStoryboard storyboard: Storyboard,
//                    withContext context: RouteContext? = nil) {
//        Router(viewController: self)
//            .openScreen(screen, fromStoryboard: storyboard, isChildScreen: false, withContext: context)
//    }
//
//    func openChildScreen(_ screen: Constants.Scenes,
//                         fromStoryboard storyboard: Storyboard,
//                         withContext context: RouteContext? = nil) {
//        Router(viewController: self)
//            .openScreen(screen, fromStoryboard: storyboard, isChildScreen: true, withContext: context)
//    }
//
//    func backToPrevScreen(with context: RouteContext? = nil) {
//        Router(viewController: self).backToPrevScreen(with: context)
//    }
//}
