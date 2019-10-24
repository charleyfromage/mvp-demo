//
//  Router.swift
//  MVP
//
//  Created by Fromage Charley on 24/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

class Router {
    let currentController: UIViewController

    init(viewController: UIViewController) {
        self.currentController = viewController
    }

    func openScreen(_ screen: Constants.Scenes,
                    fromStoryboard storyboard: Constants.Storyboards,
                    isChildScreen: Bool,
                    withContext context: RouteContext? = nil) {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: screen.rawValue)

        if var nextRoutableScreen = nextViewController as? RoutableScreen {
            nextRoutableScreen.context = context
        }

        if isChildScreen {
            currentController.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            currentController.present(nextViewController, animated: true, completion: nil)
        }
    }

    func backToPrevScreen(with context: RouteContext? = nil) {
        if let stackScreensCount = currentController.navigationController?.viewControllers.count,
           var prevRoutableController = currentController.navigationController?.viewControllers[stackScreensCount-2] as? RoutableScreen {
            prevRoutableController.context = context
        }

        currentController.navigationController?.popViewController(animated: true)

    }
}
