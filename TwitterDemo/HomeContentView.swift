//
//  HomeContentView.swift
//  TwitterDemo
//
//  Created by Māris Lakšs on 10/04/2023.
//

import SwiftUI

struct HomeContentView: View {
    @StateObject private var viewModel = HomeContentViewModel()
    @State private var isPresented = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List {
                ForEach(viewModel.tweets, id: \.id) { tweet in
                    TweetRow(tweet: tweet)
                        .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.visible)
                        .buttonStyle(.plain)
                }
            }
            .listStyle(.plain)
            .onAppear {
                viewModel.loadTweets()
            }

            Button(action: {
                self.isPresented.toggle()
            }) {
                Image("newTweet")
                    .resizable()
                    .frame(width: 55, height: 55)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
            .sheet(isPresented: $isPresented) {
                NewTweetView(isPresented: self.$isPresented)
            }
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
