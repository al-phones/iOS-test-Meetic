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

    var viewModel: HomeViewModel!
    private let dataSource = HomeViewDataSource()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bind(to: viewModel)
        bind(to: dataSource)
        viewModel.viewDidLoad()
    }

    // MARK: - Private

    private func bind(to viewModel: HomeViewModel) {
        viewModel.homeCharacters = { [weak self] characters in
            guard let self = self else { return }
            self.dataSource.characters = characters
            self.tableView.reloadData()
        }

        viewModel.isLoading = { [weak self] isLoading in
            self?.tableView.isUserInteractionEnabled = !isLoading
        }
    }

    private func bind(to dataSource: HomeViewDataSource) {
        dataSource.didSelectCharacter = { [weak self] index in
            self?.viewModel.didSelectCharacter(at: index)
        }

        dataSource.didReachScrollBottom = { [weak self] in
            self?.viewModel.fetchNextCharacters()
        }
    }

    private func configureTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.register(UINib(nibName: "HomeCharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCharacterTableViewCell")
    }
}
