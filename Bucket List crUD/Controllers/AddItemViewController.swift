//
//  AddItemViewController.swift
//  Bucket List crUD
//
//  Created by Mostafa Nafie on 14/12/21.
//

import UIKit

class AddItemViewController: UIViewController {
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTitle()
        setupBarButtonItem()
    }
}

// MARK: - Private Methods
extension AddItemViewController {
    private func setupTitle() {
        title = "Add Item"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Save",
            style: .plain,
            target: self,
            action: #selector(saveButtonTapped)
        )
    }

    @objc private func saveButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
