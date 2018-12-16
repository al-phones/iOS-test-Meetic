//
//  HomeViewController.swift
//  test-meetic
//
//  Created by Alex Phonesavanh on 16/12/2018.
//  Copyright © 2018 aphones. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var viewModel = HomeViewModel()
    private let dataSource = HomeViewDataSource()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }

    // MARK: - Private

    private func bind(to viewModel: HomeViewModel) {
        viewModel.displayableCharacters = { [weak self] characters in
            guard let self = self else { return }
            self.dataSource.characters = characters
            self.tableView.reloadData()
        }
    }

    private func configureTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.register(UINib(nibName: "HomeCharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCharacterTableViewCell")
    }
}

final class HomeViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var characters: [Character] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCharacterTableViewCell") as? HomeCharacterTableViewCell else {
            fatalError("HomeTableViewCell not well implemented")
        }
        cell.configure(with: characters[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
