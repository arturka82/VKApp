//
//  FeedTableViewController.swift
//  VKApp
//
//  Created by Artur Gedakyan on 16.03.2021.
//

import UIKit

/// FeedTableViewController
final class FeedTableViewController: UITableViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var table: UITableView!
    
    // MARK: - Public Properties
    var qunemGandon: Users? = nil
    
    // MARK: - Private Properties
    private let control = VerticalControl()
    private var modelUsers = [Users]()

    override func viewDidLoad() {
        super.viewDidLoad()
        control.setupView()
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
    }
}

// MARK: - Table view data source
extension FeedTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsListTableViewCell.id, for: indexPath) as? FriendsListTableViewCell else { return UITableViewCell() }
        cell.configure(model: modelUsers[indexPath.row])

        return cell
    }
}

// MARK: - Table view delegate
extension FeedTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        qunemGandon = modelUsers[indexPath.row]
        performSegue(withIdentifier: "collectionSegue", sender: qunemGandon)
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        ["Е", "М", "В", "Б", "Е", "М", "В", "Б"]
    }
}
