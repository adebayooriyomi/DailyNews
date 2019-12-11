//
//  PublishersTable.swift
//  DailyNews
//
//  Created by Adebayo Oriyomi on 2019-10-30.
//  Copyright © 2019 Adebayo Oriyomi. All rights reserved.
//

import UIKit

class PublishersTable: UITableViewController {
    
    var publishers = [PublisherModel](){
        didSet{
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewsAPI.loadSources { (Publishers) in
            print(Publishers)
            self.publishers = Publishers.sources
        }
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return publishers.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let pubIndex = publishers[indexPath.row]
        cell.textLabel?.text = pubIndex.name
        cell.detailTextLabel?.text = pubIndex.category

        return cell
    }
   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! SelectedPublisherCollectionViewController
        let cell = sender as! UITableViewCell
        let indexPath = self.tableView.indexPath(for: cell)
        let title = publishers[indexPath!.row].name
        let newsId = publishers[indexPath!.row].id
        destination.navigationItem.title = title
        destination.newsId = newsId!
    }
    

}
