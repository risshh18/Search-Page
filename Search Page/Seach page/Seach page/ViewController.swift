//
//  ViewController.swift
//  Seach page
//
//  Created by Rishabh Tripathi on 10/02/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let burgerButton = UIBarButtonItem()

    let searchButton = UIBarButtonItem(image: UIImage(named: "search-interface-symbol 1"))
    
    let searchBarField = UITextField(frame: CGRect(x: 0, y: 0, width: 250, height: 35))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        burgerButton.image = UIImage(systemName: "line.horizontal.3")
        burgerButton.tintColor = .black
        burgerButton.target = self
        burgerButton.action = #selector(backButtonClicked(_:))
        burgerButton.style = .plain
        navigationItem.leftBarButtonItem = burgerButton
       
        searchButton.tintColor = .black
        searchButton.style = .plain
        searchButton.target = self
        searchButton.action = #selector(searchButtonClicked(_:))
        navigationItem.rightBarButtonItem = searchButton
        
        searchBarField.isHidden = true
        searchBarField.backgroundColor = .white
        searchBarField.clearButtonMode = .whileEditing
        searchBarField.delegate = self
        searchBarField.placeholder = "Search For Anything"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.titleView = searchBarField
    }
    
    @objc func backButtonClicked(_ sender: UIBarButtonItem) {
        if burgerButton.image == UIImage(systemName: "chevron.backward"){
            burgerButton.image = UIImage(systemName: "line.horizontal.3")
            searchBarField.isHidden = true
        }
    }
    
    @objc func searchButtonClicked(_ sender: UIBarButtonItem) {
        searchBarField.isHidden = false
        burgerButton.image = UIImage(systemName: "chevron.backward")
    }
    
    func textFieldShouldReturn(_ searchBarField: UITextField) -> Bool {
        let nextViewController = self.storyboard?.instantiateViewController(identifier: "StartScreenViewController") as! StartScreenViewController
        navigationController?.pushViewController(nextViewController, animated: true)
        navigationItem.backBarButtonItem?.title = ""
        return true
    }
}

