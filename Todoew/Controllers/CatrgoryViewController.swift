//
//  CatrgoryViewController.swift
//  Todoew
//
//  Created by Mac User on 2/14/18.
//  Copyright © 2018 ZeppoWare. All rights reserved.
//

import UIKit
import CoreData

class CatrgoryViewController: UITableViewController {

    var categoryArray = [Category]()
    
    
    
    //let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
  
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadItems()
        
    }

    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categoryArray[indexPath.row].name
        
        return cell

    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     performSegue(withIdentifier: "goToItems", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
            
        }
    }
    
    
    //MARK: - Add New Categories
    
    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
    
    var textField = UITextField()
    
    let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Add", style: .default) { (action) in
        //what will happen once the user clickes the Add button on our UIAlert
        
        
        let newCategory = Category(context: self.context)
        newCategory.name = textField.text!
        //newCategory.done = false
        self.categoryArray.append(newCategory)
        
    self.saveCategory()
    }
    
    alert.addTextField { (alertTextField) in
    alertTextField.placeholder = "Create new item"
    textField = alertTextField
    
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
}
       
    
    //MARK: - Data Manipulation Methods
    func saveCategory() {
        
        do {
            try context.save()
        } catch {
            print("Error saving category \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadItems(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error fetching category \(error)")
        }
        tableView.reloadData()
    }
    
}
    
    
    

    
    
    
    
    

