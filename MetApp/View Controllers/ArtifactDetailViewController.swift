//
//  ArtifactDetailViewController.swift
//  MetApp
//
//  Created by Albert Yu on 6/26/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

import UIKit

class ArtifactDetailViewController: UIViewController {
    
    var artifactLandingPad: Artifact?
    
    @IBOutlet weak var artifactLabel: UILabel!
    @IBOutlet weak var artifactImageView: UIImageView!
    @IBOutlet weak var artifactDepartment: UILabel!
    @IBOutlet weak var artifactArtist: UILabel!
    @IBOutlet weak var artifactEndDate: UILabel!
    @IBOutlet weak var artifactMedium: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let artifact = artifactLandingPad else {return}
        updateViewWith(with: artifact)
    }
    
    func updateViewWith(with artifact: Artifact) {
        DispatchQueue.main.async {
            self.artifactLabel.text = artifact.title
            self.artifactDepartment.text = artifact.department
            self.artifactArtist.text = artifact.artistDisplayName
            self.artifactEndDate.text = String(artifact.objectEndDate)
            self.artifactMedium.text = artifact.medium
        }
    }
}
