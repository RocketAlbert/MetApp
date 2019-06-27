//
//  ArtifactController.swift
//  MetApp
//
//  Created by Albert Yu on 6/26/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

import Foundation

class ArtifactController {
    static let sharedInstance = ArtifactController()
    
    var artifacts: [Artifact] = []
    
    func fetchArtifact(searchTerm: String, completion: @escaping(Artifact?) -> Void) {
        
        // Creating the URL
        let baseURL = URL(string: "https://collectionapi.metmuseum.org/public/collection/v1")
        let objectsPathComponentURL = baseURL?.appendingPathComponent("objects")
        guard let finalURL = objectsPathComponentURL?.appendingPathComponent(searchTerm) else {return}
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error  {
                print("There was an error: \(error.localizedDescription)")
            }
            
            if let data = data {
                do {
                    let artifact = try JSONDecoder().decode(Artifact.self, from: data)
                    completion(artifact)
                } catch {
                   print("Error fetching artifact.")
                    completion(nil); return
                }
            }
        } .resume()
    }
}
