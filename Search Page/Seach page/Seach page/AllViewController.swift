//
//  AllViewController.swift
//  Seach page
//
//  Created by Rishabh Tripathi on 25/02/24.
//

import UIKit

class AllViewController: UIViewController {

    @IBOutlet weak var viewAllCourses: UIButton!
    
    @IBOutlet weak var viewMore: UIButton!
    
    @IBOutlet weak var viewAllDocs: UIButton!
    
    @IBOutlet weak var viewAllTests: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewAllCourses.semanticContentAttribute = .forceRightToLeft
        viewMore.semanticContentAttribute = .forceRightToLeft
        viewAllDocs.semanticContentAttribute = .forceRightToLeft
        viewAllTests.semanticContentAttribute = .forceRightToLeft
        
    }
}
