//
//  StartScreenViewController.swift
//  Seach page
//
//  Created by Rishabh Tripathi on 18/02/24.
//

import UIKit

class StartScreenViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var allview: UIView!
    
    @IBOutlet weak var coursesView: UIView!
    
    @IBOutlet weak var categoryButton: UIButton!
    
    
    let searchButtonStart = UIBarButtonItem(image: UIImage(named: "search-interface-symbol 1"))
    
    let searchBarFieldStart = UITextField(frame: CGRect(x: 0, y: 0, width: 250, height: 35))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButtonStart.tintColor = .black
        searchButtonStart.style = .plain
        searchButtonStart.target = self
        navigationItem.rightBarButtonItem = searchButtonStart
        
        searchBarFieldStart.backgroundColor = .white
        searchBarFieldStart.clearButtonMode = .whileEditing
        searchBarFieldStart.delegate = self
        searchBarFieldStart.placeholder = "Search For Anything"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.titleView = searchBarFieldStart
        title = ""
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        categoryButton.semanticContentAttribute = .forceRightToLeft
        coursesView.isHidden = true
        categoryButton.isHidden = true
        categoryButton.semanticContentAttribute = .forceRightToLeft
        
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            coursesView.isHidden = true
            categoryButton.isHidden = true
        }
        else{
            coursesView.isHidden = false
            categoryButton.isHidden = false
        }
    }
    
}
