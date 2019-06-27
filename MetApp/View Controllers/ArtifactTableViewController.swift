//
//  ArtifactTableViewController.swift
//  MetApp
//
//  Created by Albert Yu on 6/26/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

import UIKit

class ArtifactTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artifactCell", for: indexPath)
        ArtifactController.sharedInstance.fetchArtifact(searchTerm: String(indexPath.row)) { (artifact) in
            guard let artifact = artifact else {return}
            DispatchQueue.main.async {
                cell.textLabel?.text = String(artifact.objectID)
                cell.detailTextLabel?.text = artifact.title
            }
        }
        

        return cell
    }
    

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }


}
