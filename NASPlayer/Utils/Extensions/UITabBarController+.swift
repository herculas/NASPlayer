//
//  UITabBarController+.swift
//  NASPlayer
//
//  Created by 宋睿 on 26/9/2023.
//

import UIKit

extension UITabBarController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UITabBarAppearance()
        // eliminate the separator of the tab bar
        appearance.shadowColor = nil
        self.tabBar.standardAppearance = appearance
    }
}
