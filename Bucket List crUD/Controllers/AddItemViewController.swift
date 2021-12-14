//
//  AddItemViewController.swift
//  Bucket List crUD
//
//  Created by Mostafa Nafie on 14/12/21.
//

import UIKit

protocol AddItemViewControllerDelegate {
    func addItemViewController(_ controller: AddItemViewController,
                               didFinishAddingItem item: String)
}

class AddItemViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var textField: UITextField!

    // MARK: - Variables
    var delegate: AddItemViewControllerDelegate?
    
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
        if let item = textField.text, !item.isEmpty {
            delegate?.addItemViewController(self, didFinishAddingItem: item)
        }
        navigationController?.popViewController(animated: true)
    }
}
