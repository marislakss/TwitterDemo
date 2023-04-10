//
//  HomeContentViewModel.swift
//  TwitterDemo
//
//  Created by Māris Lakšs on 10/04/2023.
//

import Foundation

class HomeContentViewModel: ObservableObject {
    @Published var tweets: [Tweet] = []

    func loadTweets() {
        guard tweets.isEmpty else {
            print("Tweets are already loaded.")
            return
        }
        guard let url = Bundle.main.url(forResource: "tweets", withExtension: "json") else {
            print("Url could not be located for the tweets.json")
            return
        }

        guard let data = try? Data(contentsOf: url) else {
            print("Could not load any data from the file")
            return
        }

        let decoder = JSONDecoder()

        do {
            let tweets = try decoder.decode([Tweet].self, from: data)

            self.tweets = tweets
        } catch {
            print("Failed to decode json: \(error.localizedDescription)")
        }
    }

    func createTweet(title _: String, description _: String) {
        let tweet = Tweet(
            id: Int.random(in: 10 ... 9000),
            username: "@Your_Username",
            nickname: "Your Name",
            created: "now",
            message: " ",
            message_image: nil,
            replies: 1,
            retweets: 2,
            favorited: 10,
            avatar_image: "oval"
        )
        tweets.append(tweet)
    }
}
