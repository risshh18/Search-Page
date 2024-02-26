//
//  DocsVideosViewController.swift
//  Seach page
//
//  Created by Rishabh Tripathi on 18/02/24.
//

import UIKit

class DocsVideosViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var sortBy: UIButton!
    
    let searchButtonDocs = UIBarButtonItem(image: UIImage(named: "search-interface-symbol 1"))

    let searchBarFieldDocs = UITextField(frame: CGRect(x: 0, y: 0, width: 250, height: 35))
    
    let menuView = UIView()
    let overlayView = UIView()
    let menuHeight: CGFloat = 320
    var isMenuVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sortBy.semanticContentAttribute = .forceRightToLeft
        
        searchButtonDocs.tintColor = .black
        searchButtonDocs.style = .plain
        searchButtonDocs.target = self
        navigationItem.rightBarButtonItem = searchButtonDocs
        
        searchBarFieldDocs.backgroundColor = .white
        searchBarFieldDocs.clearButtonMode = .whileEditing
        searchBarFieldDocs.delegate = self
        searchBarFieldDocs.placeholder = "Search For Anything"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.titleView = searchBarFieldDocs
        
        title = ""
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        menuView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: menuHeight)
        menuView.backgroundColor = .white
        view.addSubview(menuView)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            overlayView.frame = windowScene.coordinateSpace.bounds
            overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5) // Adjust alpha as needed
            overlayView.alpha = 0.0
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(overlayTapped))
            overlayView.addGestureRecognizer(tapGestureRecognizer)
            if let mainWindow = windowScene.windows.first {
                mainWindow.addSubview(overlayView)
            }
        }

        let menuButton = UIButton(type: .system)
        menuButton.setTitle("Menu", for: .normal)
        menuButton.tintColor = .black
        menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        menuButton.frame = CGRect(x: 5, y: 125, width: 100, height: 40)
        view.addSubview(menuButton)
        
        let menuLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 30))
        menuLabel.text = "Filter by Category"
        menuLabel.textColor = .black
        
        let lastMenuButton = UIButton(frame: CGRect(x: 0, y: 250, width: view.bounds.width, height: 30))
        lastMenuButton.setTitle(String("Explore other categories"), for: .normal)
        lastMenuButton.setTitleColor(.black, for: .normal)
        lastMenuButton.contentHorizontalAlignment = .center
        menuView.addSubview(lastMenuButton)
        
        let optionToggle1 = createOptionToggle(frame: CGRect(x: 20, y: 60, width: 200, height: 40), title: "Option 1")
        let optionToggle2 = createOptionToggle(frame: CGRect(x: 20, y: 120, width: 200, height: 40), title: "Option 2")
        let optionToggle3 = createOptionToggle(frame: CGRect(x: 20, y: 180, width: 200, height: 40), title: "Option 3")
        
        menuView.addSubview(menuLabel)
        menuView.addSubview(optionToggle1)
        menuView.addSubview(optionToggle2)
        menuView.addSubview(optionToggle3)

    }
    
    func createOptionToggle(frame: CGRect, title: String) -> UIButton {
        let optionToggle = UIButton()
        optionToggle.frame = frame
        optionToggle.setTitle(title, for: .normal)
        optionToggle.setTitleColor(.black, for: .normal)
        optionToggle.setImage(UIImage(named: "Frame 133"), for: .normal)
        var config = UIButton.Configuration.plain()
        config.imagePadding = 10
        optionToggle.configuration = config
        optionToggle.addTarget(self, action: #selector(optionToggleTapped(_:)), for: .touchUpInside)
        optionToggle.contentHorizontalAlignment = .left
            
        return optionToggle
    }
    
    @objc func menuButtonTapped() {
        isMenuVisible.toggle()
        if isMenuVisible {
            UIView.animate(withDuration: 0.3) {
                self.overlayView.alpha = 1.0
                self.menuView.frame.origin.y = self.view.frame.height - self.menuHeight
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.overlayView.alpha = 0.0
                self.menuView.frame.origin.y = self.view.frame.height
            }
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        overlayView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - menuHeight)
    }
            
    @objc func optionToggleTapped(_ sender: UIButton) {
        if let currentImage = sender.image(for: .normal) {
            if currentImage == UIImage(named: "Frame 133") {
                sender.setImage(UIImage(named: "Frame 132"), for: .normal)
            } else if currentImage == UIImage(named: "Frame 132") {
                sender.setImage(UIImage(named: "Frame 133"), for: .normal)
            }
        }
    }
    @objc func overlayTapped() {
        if isMenuVisible {
            menuButtonTapped()
        }
    }
}
