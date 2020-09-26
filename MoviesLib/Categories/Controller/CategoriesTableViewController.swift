//
//  CategoriesTableViewController.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 26/09/20.
//  Copyright © 2020 FIAP. All rights reserved.
//

import UIKit
import CoreData

protocol CategoriesDelegate: class {
    func setSelectedCategories(_ categories: Set<Category>)
}

class CategoriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Properties
    var categories: [Category] = []
    weak var delegate: CategoriesDelegate?
    var selectedCategories: Set<Category> = [] {
        didSet {
            delegate?.setSelectedCategories(selectedCategories)
        }
    }
    
    // MARK: - IBActions
    @IBAction func add(_ sender: Any) {

    }
    
    // MARK: - Methods
    private func loadCategories() {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            categories = try context.fetch(fetchRequest)
            tableView.reloadData()
        } catch  {
            print(error)
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.name
        return cell
    }
}
