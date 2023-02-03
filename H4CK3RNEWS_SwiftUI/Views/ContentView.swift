//
//  ContentView.swift
//  H4CK3RNEWS_SwiftUI
//
//  Created by Toni Lozano Fernández on 2/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle("H4CK3R NEWS")
        }
        .onAppear {
            networkManager.FetchData()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
