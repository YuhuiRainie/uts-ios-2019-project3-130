//
//  FirstViewController.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 20/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UISearchControllerDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var searchController = UISearchController()
    var searchResultView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hideKeyboardWhenTappedAround()
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let resultView = searchResultView  {
            resultView.isHidden = false
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let resultsTableController = storyboard.instantiateViewController(withIdentifier: "SearchResultTableViewController") as! SearchResultTableViewController
            resultsTableController.myLoadView()
            //        searchBar = resultsTableController.searchController.searchBar
            searchResultView = resultsTableController.view
            view.addSubview(searchResultView!)
        }
    }
    
    @objc override func hideKeyboardWhenTappedAround() {
        super.hideKeyboardWhenTappedAround()
        
        if let resultView = searchResultView  {
            resultView.isHidden = true
        }
    }
}

