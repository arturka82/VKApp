//
//  NewCommunityTableViewController.swift
//  VKApp
//
//  Created by Artur Gedakyan on 18.03.2021.
//

import UIKit

/// NewCommunityTableViewController
final class NewCommunityTableViewController: UITableViewController {

    @IBOutlet var table: UITableView!
    
    var modelCommunity = [Community]()

    override func viewDidLoad() {
        super.viewDidLoad()

        table.register(CommunityTableViewCell.nib(), forCellReuseIdentifier: CommunityTableViewCell.id)
        
        modelCommunity.append(Community(name: "Swiftbook.ru", userImage: "pub6", subsctiber: "10.114"))
        modelCommunity.append(Community(name: "Duxov AM", userImage: "pub7", subsctiber: "3.082"))
        modelCommunity.append(Community(name: "Орленок", userImage: "pub8", subsctiber: "891.051"))

        navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelCommunity.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "allCommunityCell", for: indexPath) as? AllCommunityTableViewCell else { return UITableViewCell() }

        cell.configure(model: modelCommunity[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        modelCommunity.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
}
