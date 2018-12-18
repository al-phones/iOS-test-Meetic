//
//  BarButtonItemFactory.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 18/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import UIKit

final class BarButtonItemFactory {
    func makeBackButtonItem(target: Any, action: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(title: "Back", style: .plain, target: target, action: action)
    }
}
