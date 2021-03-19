//
//  HomeTableViewController.swift
//  VKApp
//
//  Created by Artur Gedakyan on 18.03.2021.
//

import UIKit

class HomeTableViewController: UITableViewController {

    @IBOutlet var table: UITableView!
    
    private var modelPost = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.id)
        
        modelPost.append(Post(smallImageUser: "head4", nameImageView: "head5", likeCount: "555", postName: "Nice day"))
        modelPost.append(Post(smallImageUser: "head1", nameImageView: "pub7", likeCount: "555", postName: "Артур, рельно могет"))
        modelPost.append(Post(smallImageUser: "head4", nameImageView: "head5", likeCount: "555", postName: "Qunem gandon vord"))
        modelPost.append(Post(smallImageUser: "head4", nameImageView: "head5", likeCount: "555", postName: "Qunem gandon vord"))
        modelPost.append(Post(smallImageUser: "head4", nameImageView: "head5", likeCount: "555", postName: "Qunem gandon vord"))
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelPost.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }

        cell.selectionStyle = .none
        cell.configure(model: modelPost[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        420
    }
}
