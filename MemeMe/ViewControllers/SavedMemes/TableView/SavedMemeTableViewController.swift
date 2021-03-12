//
//  SavedMemeTableViewController.swift
//  MemeMe
//
//  Created by Sri Harsha Chilakapati on 12/03/21.
//

import UIKit

class SavedMemeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SavedMemeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SavedMemeTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Hide the extra separator lines in Grid
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (UIApplication.shared.delegate as! AppDelegate).memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedMemeTableViewCell", for: indexPath) as! SavedMemeTableViewCell
        cell.bindToMeme((UIApplication.shared.delegate as! AppDelegate).memes[indexPath.row])
        return cell
    }
}
