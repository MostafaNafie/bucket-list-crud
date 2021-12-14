//
//  BucketListVC.swift
//  Bucket List crUD
//
//  Created by Mostafa Nafie on 14/12/21.
//

import UIKit

class BucketListVC: UITableViewController {

    // MARK: - Variables
    private var items = ["Sky diving", "Live in Hawaii"]

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTitle()
        setupBarButtonItem()
    }

}

// MARK: - TableView DataSource
extension BucketListVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell",
                                                 for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension BucketListVC {
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let row = indexPath.row
        let item = items[row]
        editButtonTapped(at: row, with: item)
    }
}

// MARK: - AddItemViewController Delegate
extension BucketListVC: ItemViewControllerDelegate {
    func itemViewController(_ controller: ItemVC, didFinishAddingItem item: String) {
        items.append(item)
        let indexPath = IndexPath(row: items.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }


    func itemViewController(_ controller: ItemVC, didFinishEditingItem item: String, at row: Int) {
        items[row] = item
        let indexPath = IndexPath(row: row, section: 0)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

// MARK: - Private Methods
extension BucketListVC {
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
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: ItemVC.self)) as! ItemVC
        viewController.mode = .add
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }

    private func editButtonTapped(at row: Int, with item: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: ItemVC.self)) as! ItemVC
        viewController.delegate = self
        viewController.mode = .edit(row, item)
        navigationController?.pushViewController(viewController, animated: true)
    }
}