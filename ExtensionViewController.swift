//
//  ExtensionViewController.swift
//  worldCloc
//
//  Created by Дмитрий Яновский on 18.02.24.
//

import UIKit


extension ViewController: UITableViewDelegate, UITableViewDataSource, AddWorldTimeDelegate {
    
    func didAddWorldTime(_ worldTime: WorldTime) {
        worldTimeArray.append(worldTime)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldTimeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorldTimeTableViewCell", for: indexPath) as! WorldTimeTableViewCell
        cell.configure(timezone: worldTimeArray[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
//        headerView.backgroundColor = .orange
//
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width - 50, height: 30))
//        label.text = "Мировые часы"
//        label.textColor = .white
//        label.font = UIFont.boldSystemFont(ofSize: 30)
//        headerView.addSubview(label)
//
//        return headerView
//    }
    
}
