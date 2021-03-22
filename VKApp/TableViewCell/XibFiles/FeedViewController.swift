//
//  FeedViewController.swift
//  VKApp
//
//  Created by Artur Gedakyan on 19.03.2021.
//

import UIKit

/// FeedViewController
final class FeedViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var pickerControll: VerticalControl!
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    // MARK: - Public Properties
    var qunemGandon: Users? = nil
    
    
    // MARK: - Private Properties
    private var modelUsers = [Users]()
    var poiskFriend: [String] = []
    var filterFriend: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadArray()
        
        table.delegate = self
        table.dataSource = self
        
        table.register(FriendsListTableViewCell.nib(), forCellReuseIdentifier: FriendsListTableViewCell.id)
        
        modelUsers.append(Users(name: "Евгений", userImage: "head1"))
        modelUsers.append(Users(name: "Моя жена", userImage: "head2"))
        modelUsers.append(Users(name: "Моя девушка", userImage: "head3"))
        modelUsers.append(Users(name: "Ваз 2105", userImage: "head4"))
        modelUsers.append(Users(name: "Бестия", userImage: "head5"))
        
    }
    
    // MARK: - Public methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? DetailCollectionViewController {
            target.qunemGandon = qunemGandon
        }
        
        func scrolltoRow(mass: String) {
            let index = modelUsers.firstIndex {
                $0.name.contains(mass)
            }
            let indexPath = IndexPath(row: index ?? 0, section: 0)
            table.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    func loadArray() {
        for k in modelUsers {
            let newName = k.name
            poiskFriend.append(newName)
        }
    }
}

// MARK: - FeedViewController
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsListTableViewCell.id, for: indexPath) as? FriendsListTableViewCell else { return UITableViewCell() }
        cell.configure(model: modelUsers[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        qunemGandon = modelUsers[indexPath.row]
        performSegue(withIdentifier: "collectionSegue", sender: qunemGandon)
    }
    
}

extension FeedViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            filterFriend = poiskFriend
        } else {
            for value in poiskFriend {
                if value.lowercased().contains(searchText.lowercased()) {
                    filterFriend.append(value)
                }
            }
        }
        table.reloadData()

    }
}
