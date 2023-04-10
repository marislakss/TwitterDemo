//
//  ContentView.swift
//  TwitterDemo
//
//  Created by Māris Lakšs on 10/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image("group4")
                        .renderingMode(.template)
                }

            Text("Search screen")
                .tabItem {
                    Image("group3")
                        .renderingMode(.template)
                }

            Text("Notifications screen")
                .tabItem {
                    Image("group2")
                        .renderingMode(.template)
                }

            Text("Messages screen")
                .tabItem {
                    Image("group")
                        .renderingMode(.template)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
