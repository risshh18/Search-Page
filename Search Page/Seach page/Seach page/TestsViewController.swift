//
//  TestsViewController.swift
//  Seach page
//
//  Created by Rishabh Tripathi on 18/02/24.
//

import UIKit

class TestsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var sortBy: UIButton!
    
    let searchButtonTest = UIBarButtonItem(image: UIImage(named: "search-interface-symbol 1"))
    
    let searchBarFieldTest = UITextField(frame: CGRect(x: 0, y: 0, width: 250, height: 35))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sortBy.semanticContentAttribute = .forceRightToLeft
        
        searchButtonTest.tintColor = .black
        searchButtonTest.style = .plain
        searchButtonTest.target = self
        navigationItem.rightBarButtonItem = searchButtonTest
        
        searchBarFieldTest.backgroundColor = .white
        searchBarFieldTest.clearButtonMode = .whileEditing
        searchBarFieldTest.delegate = self
        searchBarFieldTest.placeholder = "Search For Anything"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.titleView = searchBarFieldTest
        
        title = ""
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    @IBAction func sortByButton(_ sender: UIButton) {
        sortBy.menu = addSortItems()
    }
    
    func addSortItems() -> UIMenu {
        let menuItems = UIMenu(title: "", options: .displayInline, children:[
            UIAction(title: "Most Viewed", handler: {(_) in print("most")}),
            UIAction(title: "Relevance", handler: {(_) in print("rele")})
            ])
        return menuItems
    }
}
