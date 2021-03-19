//
//  CommunityTableViewController.swift
//  VKApp
//
//  Created by Artur Gedakyan on 18.03.2021.
//

import UIKit

final class CommunityTableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    private var modelCommunity = [Community]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelCommunity.append(Community(name: "MDK", userImage: "pub1", subsctiber: "11.654.401"))
        modelCommunity.append(Community(name: "Борщ", userImage: "pub2", subsctiber: "7.024.180"))
        modelCommunity.append(Community(name: "The swift Developers", userImage: "pub3", subsctiber: "4.722"))
        modelCommunity.append(Community(name: "NO DRIFT, NO FUN", userImage: "pub4", subsctiber: "125.711"))
        modelCommunity.append(Community(name: "CocoaHeads Russia", userImage: "pub5", subsctiber: "2.082"))
        
        table.register(CommunityTableViewCell.nib(), forCellReuseIdentifier: CommunityTableViewCell.id)
        
         navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func addCommunity(segue: UIStoryboardSegue) {
        if segue.identifier == "addCom" {
            guard let allCom = segue.source as? NewCommunityTableViewController else { return }
            
            if let indexPath = allCom.tableView.indexPathForSelectedRow {
                let com = allCom.modelCommunity[indexPath.row]
                
                modelCommunity.append(com)
                
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelCommunity.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommunityTableViewCell.id, for: indexPath) as? CommunityTableViewCell else { return UITableViewCell() }
        cell.configure(model: modelCommunity[indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            modelCommunity.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }

}
