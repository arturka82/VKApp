//
//  FeedViewController.swift
//  VKApp
//
//  Created by Artur Gedakyan on 19.03.2021.
//

import UIKit

class FeedViewController: UIViewController {

    private var modelUsers = [Users]()
    
    @IBOutlet weak var pickerControll: VerticalControl!
    var qunemGandon: Users? = nil

    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        table.register(FriendsListTableViewCell.nib(), forCellReuseIdentifier: FriendsListTableViewCell.id)
        
        modelUsers.append(Users(name: "Евгений", userImage: "head1"))
        modelUsers.append(Users(name: "Моя жена", userImage: "head2"))
        modelUsers.append(Users(name: "Моя девушка", userImage: "head3"))
        modelUsers.append(Users(name: "Ваз 2105", userImage: "head4"))
        modelUsers.append(Users(name: "Бестия", userImage: "head5"))
        
    }
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
}


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

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        qunemGandon = modelUsers[indexPath.row]
        performSegue(withIdentifier: "collectionSegue", sender: qunemGandon)
    }

}
