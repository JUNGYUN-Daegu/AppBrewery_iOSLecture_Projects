//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

//Subclass this view controller with UITableView Controller
//UITableViewController를 씀으로써 FlashChat에서 했던 Delegate 설정 등이 Xcode가 자동화 했다.
class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        print (dataFilePath!)
        
//        //Item 클래스 이니셜라이징 후에 배열에 집어 넣기...brilliant
//            let newItem1 = Item()
//            newItem1.title = "Find Mike"
//            newItem1.done = true
//            itemArray.append(newItem1)
//
//            let newItem2 = Item()
//            newItem2.title = "Buy Milk"
//            itemArray.append(newItem2)
//
//
//            let newItem3 = Item()
//            newItem3.title = "Jungyun Jo"
//            itemArray.append(newItem3)

        loadItems()
        
    }

    //MARK: - Tableview Datasource Methods
    
    //테이블 뷰에 값 넣는 거 복습: 일단 테이블 뷰의 row 수를 정해준다. 반환값이 Int인 것에 주목
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    //반환값이 UITableViewCell인 것에 주목 //tableView가 로드될 때 적용되는 메소드. 즉 ReloadData메소드와 조합되어야 테이블뷰가 업데이트 됨.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("CellForRowAt loaded up")
        
        
        let item = itemArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        //indexPath.row: indexPath를 Int로 만들기 위해?
        cell.textLabel?.text = item.title
    
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row) : 0부터 시작
        print(tableView.cellForRow(at: indexPath)?.textLabel?.text ?? "")
        
        
        //opposite 값 반환. Boolean을 깨끗하게 쓸 수 있는 문법
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }

    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            //reason why this doesn't work is because AppDelegate is a class, it's not the object of AppDelegate. So remember, when we refer to the TodoListViewController, for example, we won't try to call its methods or grab its properties by calling the class. Instead, we need to get the object of AppDelegate. So this would be the blueprint and we need to get the object that's created from the blueprint.
//            let context = AppDelegate.persistentContainer.viewContext
            
            //So this, again, is where our handy singletons come into use. And instead of calling App Delegate, I'm instead going to tap into UIApplication.shared, and this is a singleton app instance.
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newItem = Item(context: context)
            newItem.title = textField.text!
            //the text property of a text field is never going to equal nil, even if it's empty, it's going to be set to an empty string
            
            self.itemArray.append(newItem)
            
            self.saveItems()
            
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
//MARK: - Model Manupulation Method
    func saveItems() {
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to:dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
            itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding")
            }
        }
        
       
    }
}

