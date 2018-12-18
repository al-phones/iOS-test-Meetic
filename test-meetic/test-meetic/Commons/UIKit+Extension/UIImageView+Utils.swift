//
//  UIImageView+Utils.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 18/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url),
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}
