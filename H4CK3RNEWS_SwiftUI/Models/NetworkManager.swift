//
//  NetworkManager.swift
//  H4CK3RNEWS_SwiftUI
//
//  Created by Toni Lozano Fernández on 2/2/23.
//

import Foundation


class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    let HNUrl = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    func FetchData() {
        if let url = URL(string: HNUrl) {
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url) { data, response, error in
                if (error != nil) {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let results = self.ParseJSON(saveData: safeData) {
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }

                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func ParseJSON(saveData: Data) -> Results? {
        let decoder = JSONDecoder()
        do  {
            let results = try decoder.decode(Results.self, from: saveData)
            return results
        } catch {
            print(error)
            return nil
        }
    }
    
}
