//
//  HomeViewDataSourceTests.swift
//  test-meeticTests
//
//  Created by Alex Phonesavanh on 19/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import XCTest
@testable import test_meetic

class HomeViewDataSourceTests: XCTestCase {

    // MARK: - TableViewCell

    func testWhenGetCellForRow_itReturnsCorrectCell() {
        let dataSource = HomeViewDataSource()
        dataSource.characters = [
            HomeCharacter(name: "Rick Sanchez", imageUrl: URL(string: "/rick.png")),
            HomeCharacter(name: "Morty Smith", imageUrl: URL(string: "/morty.png"))
        ]
        let tableView = UITableView()
        tableView.register(UINib(nibName: String(describing: HomeCharacterTableViewCell.self), bundle: Bundle(for: HomeCharacterTableViewCell.self)),
                           forCellReuseIdentifier: String(describing: HomeCharacterTableViewCell.self))
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
    }
}
