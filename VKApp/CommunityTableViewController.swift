//
//  CommunityTableViewController.swift
//  VKApp
//
//  Created by Artur Gedakyan on 18.03.2021.
//

import UIKit

final class CommunityTableViewController: UITableViewController {
    // MARK: - IBOutlet
    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    // MARK: - Private Properties
    private var modelCommunity = [Community]()
    private var dupmodelPost = [Community]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        modelCommunity.append(Community(name: "MDK", userImage: "pub1", subsctiber: "11.654.401"))
        modelCommunity.append(Community(name: "Борщ", userImage: "pub2", subsctiber: "7.024.180"))
        modelCommunity.append(Community(name: "The swift Developers", userImage: "pub3", subsctiber: "4.722"))
        modelCommunity.append(Community(name: "NO DRIFT, NO FUN", userImage: "pub4", subsctiber: "125.711"))
        modelCommunity.append(Community(name: "CocoaHeads Russia", userImage: "pub5", subsctiber: "2.082"))
        dupmodelPost = modelCommunity

        table.register(CommunityTableViewCell.nib(), forCellReuseIdentifier: CommunityTableViewCell.id)
        
         navigationItem.rightBarButtonItem = self.editButtonItem
        let theTap = UITapGestureRecognizer(target: self, action: #selector(tableTap))
        table.addGestureRecognizer(theTap)
        
    }
    
    // MARK: - IBAction
    @IBAction func addCommunity(segue: UIStoryboardSegue) {
        if segue.identifier == "addCom" {
            guard let allCom = segue.source as? NewCommunityTableViewController else { return }
            
            if let indexPath = allCom.tableView.indexPathForSelectedRow {
                let com = allCom.modelCommunity[indexPath.row]
                
                dupmodelPost.append(com)
                
                tableView.reloadData()
            }
        }
        
        
   
    }
    @objc private func tableTap(recognizer: UIGestureRecognizer) {
              table.endEditing(true)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dupmodelPost.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommunityTableViewCell.id, for: indexPath) as? CommunityTableViewCell else { return UITableViewCell() }
        cell.configure(model: dupmodelPost[indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            modelCommunity.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension CommunityTableViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
        
        dupmodelPost = modelCommunity
        table.reloadData()

    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        dupmodelPost = searchText.isEmpty ? modelCommunity : modelCommunity.filter({ (model) -> Bool in
            return model.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        })
     
        table.reloadData()

    }
}
