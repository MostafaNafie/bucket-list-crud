//
//  BucketListViewController.swift
//  Bucket List crUD
//
//  Created by Mostafa Nafie on 14/12/21.
//

import UIKit

class BucketListViewController: UITableViewController {

    // MARK: - Variables
    private var items = ["Sky diving", "Live in Hawaii"]

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTitle()
        setupBarButtonItem()
    }

}

// MARK: - TableView Datasource
extension BucketListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}

// MARK: - Private Methods
extension BucketListViewController {
    private func setupTitle() {
        title = "Bucket List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
    }

    @objc private func addButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: AddItemViewController.self))
        navigationController?.pushViewController(viewController, animated: true)
    }
}
