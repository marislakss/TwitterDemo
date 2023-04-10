//
//  HomeView.swift
//  TwitterDemo
//
//  Created by Māris Lakšs on 10/04/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var isPresentingNewTweet = false

    var body: some View {
        NavigationStack {
            HomeContentView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            // do nothing
                        } label: {
                            Image("oval")
                                .resizable()
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Home")
                            .bold()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.isPresentingNewTweet = true
                        } label: {
                            Image("iconSparkle")
                                .resizable()
                        }
                    }
                }
        }
        .sheet(isPresented: $isPresentingNewTweet) {
            NewTweetView(isPresented: self.$isPresentingNewTweet)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
