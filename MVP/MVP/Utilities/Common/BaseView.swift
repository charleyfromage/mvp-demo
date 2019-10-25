//
//  BaseView.swift
//  MVP
//
//  Created by Fromage Charley on 25/10/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

protocol BaseView {
    func openScreen(_ screen: Constants.Scenes, fromStoryboard storyboard: Constants.Storyboards, withContext context: RouteContext?)

    func openChildScreen(_ screen: Constants.Scenes, fromStoryboard storyboard: Constants.Storyboards, withContext context: RouteContext?)

    func backToPrevScreen(with context: RouteContext?)
}
