//
//  UINAvigationController+Extentions.swift
//  GoodWeather
//
//  Created by 2B on 31/12/2023.
//

import Foundation
import UIKit

extension UINavigationController{
    func pushViewControllerWithModalTransition(viewController: UIViewController) {
        setupPushTransition()
        self.pushViewController(viewController, animated: false)
    }

    func setupPushTransition () {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromBottom
        self.view.layer.add(transition, forKey: kCATransition)
    }
}

