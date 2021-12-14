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
    }

}

// MARK: - TableView Datasource
extension BucketListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
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
}
