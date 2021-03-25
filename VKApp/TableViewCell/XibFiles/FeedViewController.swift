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
    private var usernames: [String] = []
    private var userImage: [String] = []
    private var sections = [Section]()


    private var dupmodelPost = [Users]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        table.delegate = self
        table.dataSource = self
        
        table.register(FriendsListTableViewCell.nib(), forCellReuseIdentifier: FriendsListTableViewCell.id)
        
        modelUsers.append(Users(name: "Евгений", userImage: "head1"))
        modelUsers.append(Users(name: "Моя жена", userImage: "head2"))
        modelUsers.append(Users(name: "Моя девушка", userImage: "head3"))
        modelUsers.append(Users(name: "Ваз 2105", userImage: "head4"))
        modelUsers.append(Users(name: "Бестия", userImage: "head5"))
        
        dupmodelPost = modelUsers
        
        loadArray()
        table.reloadData()
        
        let theTap = UITapGestureRecognizer(target: self, action: #selector(tableTap))
        table.addGestureRecognizer(theTap)
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
    
    private func loadArray() {
        for value in modelUsers {
            usernames.append(value.name)
        }
        for value in modelUsers {
            userImage.append(value.userImage)
        }
        let groupedDictionary = Dictionary(grouping: usernames, by: {String($0.prefix(1))})
        let keys = groupedDictionary.keys.sorted()
        sections = keys.map{ Section(letter: $0, names: groupedDictionary[$0]!.sorted()) }
        
    }
    
    @objc private func tableTap(recognizer: UIGestureRecognizer) {
        table.endEditing(true)
    }
}

// MARK: - FeedViewController
extension FeedViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsListTableViewCell.id, for: indexPath) as? FriendsListTableViewCell else { return UITableViewCell() }
            let section = sections[indexPath.section]
            let username = section.names[indexPath.row]
            cell.userNameLabel.text = username
            cell.userImageView?.image = UIImage(named: username)
        
//            cell.selectionStyle = .none
        
            return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].letter
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
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
        
        dupmodelPost = modelUsers
        table.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        dupmodelPost = searchText.isEmpty ? modelUsers : modelUsers.filter({ (model) -> Bool in
            return model.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        })
        table.reloadData()
    }
}
