//
//  ViewController.swift
//  MyHood
//
//  Created by Serényi  Zsófia on 2018. 08. 01..
//  Copyright © 2018. Serényi  Zsófia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // Outlets
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
        
        DataService.instance.loadPosts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        }
        return PostCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataService.instance.loadedPosts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @objc func onPostsLoaded(_ notif: AnyObject) {
        tableView.reloadData()
    }

}

