//
//  HomeViewDataSource.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 19/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import UIKit

final class HomeViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var characters: [HomeCharacter] = []
    var didSelectCharacter: ((Int) -> Void)?
    var didReachScrollBottom: (() -> Void)?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeCharacterTableViewCell.self)) as! HomeCharacterTableViewCell
        cell.configure(with: characters[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectCharacter?(indexPath.row)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottomContentOffsetY = scrollView.contentSize.height - scrollView.frame.height
        let contentOffsetY = scrollView.contentOffset.y
        if contentOffsetY >= bottomContentOffsetY {
            didReachScrollBottom?()
        }
    }
}
