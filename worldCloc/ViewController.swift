//
//  ViewController.swift
//  worldCloc
//
//  Created by Дмитрий Яновский on 18.02.24.
//

import UIKit

class ViewController: UIViewController {

    var worldTimeArray: Array<WorldTime> = []
   
    

    var popover: UIPopoverPresentationController?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
      
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
        tableView.reloadData()
        
        
       
    }
    private func setupNavigation() {
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showPopover))
        navigationItem.rightBarButtonItem = plusButton
        plusButton.tintColor = .orange
        title = "Мировые часы"
    }
    
    private func setupTableView() {
//        tableView.backgroundColor = .systemGray
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        
        tableView.register(WorldTimeTableViewCell.self, forCellReuseIdentifier: "WorldTimeTableViewCell")
    }

    @objc func showPopover() {
        let contentViewController = AddWorldTimeTableViewController()
        contentViewController.delegate = self
        contentViewController.modalPresentationStyle = .popover
        popover = contentViewController.popoverPresentationController
        
        present(contentViewController, animated: true, completion: nil)
    }
    
}




  
