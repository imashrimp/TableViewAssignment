//
//  CaseThreeTableViewController.swift
//  TableViewAssignment
//
//  Created by 권현석 on 2023/07/27.
//

import UIKit

class CaseThreeTableViewController: UITableViewController {
    
    @IBOutlet var shoppingItemTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList: [String] = ["샤워기 호스", "샤워기 헤더", "면도기", "위생백"]
    var userDefaultsShoppingList = UserDefaults.standard.stringArray(forKey: "shoppingList")
    
    
    var idk: [String] {
        get {
            guard let test = UserDefaults.standard.stringArray(forKey: "shoppingList") else {
                return shoppingList
            }
            return test
        }
        set {
            self.idk = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField(placeholderText: "구매할 물건을 입력하세요",
                           placeholderColor: .lightGray,
                           backgroundColor: .black,
                           fontsize: 20,
                           textColor: .white)
        
        configureButton(title: "추가",
                        titleColor: .white,
                        backgroundColor: .systemOrange)
        
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let shoppingItem = shoppingItemTextField.text else { return }
        
        guard let item = UserDefaults.standard.stringArray(forKey: "shoppingList") else {
            shoppingList.insert(shoppingItem, at: 0)
            UserDefaults.standard.set(shoppingList, forKey: "shoppingList")
            userDefaultsShoppingList = UserDefaults.standard.stringArray(forKey: "shoppingList")
            tableView.reloadData()
            return
        }
        
        var newItem: [String] = []
        newItem = item
        newItem.insert(shoppingItem, at: 0)
        UserDefaults.standard.setValue(newItem, forKey: "shoppingList")
        userDefaultsShoppingList = UserDefaults.standard.stringArray(forKey: "shoppingList")
        tableView.reloadData()
    }
    
    func configureButton(title: String, titleColor:UIColor, backgroundColor: UIColor) {
        addButton.backgroundColor = backgroundColor
        addButton.setTitle(title, for: .normal)
        addButton.setTitleColor(titleColor, for: .normal)
    }
    
    func configureTextField(placeholderText: String, placeholderColor: UIColor, backgroundColor: UIColor, fontsize: CGFloat, textColor: UIColor) {
        shoppingItemTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : placeholderColor])
        shoppingItemTextField.backgroundColor = backgroundColor
        shoppingItemTextField.font = .systemFont(ofSize: fontsize)
        shoppingItemTextField.textColor = textColor
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let newList = userDefaultsShoppingList else {
            return shoppingList.count
        }
        return  newList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "caseThree")!
        
        guard let newList = userDefaultsShoppingList else {
            cell.textLabel?.text = shoppingList[indexPath.row]
            return cell
        }
        
        cell.textLabel?.text = newList[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    
    
}
