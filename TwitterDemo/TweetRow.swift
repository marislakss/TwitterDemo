//
//  TweetRow.swift
//  TwitterDemo
//
//  Created by Māris Lakšs on 10/04/2023.
//

import SwiftUI

struct TweetRow: View {
    let tweet: Tweet

    @State private var replySelected = false
    @State private var retweetSelected = false
    @State private var likeSelected = false
    @State private var shareSelected = false

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(tweet.avatar_image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text(tweet.nickname)
                        .font(.headline)
                    Text(tweet.username)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("·")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(tweet.created)
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Text(tweet.message)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)

                if let messageImage = tweet.message_image {
                    Image(messageImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 130)
                        .cornerRadius(20)
                }

                HStack(alignment: .center, spacing: 20) {
                    Button(action: {
                        self.replySelected.toggle()
                    }) {
                        HStack(spacing: 8) {
                            Image("reply")
                                .resizable()
                                .frame(width: 15, height: 15)
                            .foregroundColor(self.replySelected ? .red : .gray)
                            Text("\(tweet.replies)")
                                .font(.caption)
                            .foregroundColor(self.replySelected ? .red : .gray)
                        }
                        .padding(8)
                    }
                    .foregroundColor(self.replySelected == true ? Color.red : Color.gray)
                    Button(action: {
                        self.retweetSelected.toggle()
                    }) {
                        HStack(spacing: 8) {
                            Image("retweet")
                                .resizable()
                                .frame(width: 20, height: 13)
                                .foregroundColor(self.retweetSelected ? .green : .gray)
                            Text("\(tweet.retweets)")
                                .font(.caption)
                                .foregroundColor(self.retweetSelected ? .green : .gray)
                        }
                        .padding(8)
                    }
                    Button(action: {
                        self.likeSelected.toggle()
                    }) {
                        HStack(spacing: 8) {
                            Image("fave")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(self.likeSelected == true ? .blue : .gray)
                            Text("\(tweet.favorited)")
                                .font(.caption)
                                .foregroundColor(self.likeSelected == true ? .blue : .gray)
                        }
                        .padding(8)
                    }
                    Button(action: {
                        self.shareSelected.toggle()
                    }) {
                        Image("share")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(self.shareSelected == true ? .orange : .gray)
                            .padding(8)
                    }
                    Spacer()
                }

                .padding(.bottom, 12)
            }
            .padding(.trailing, 8)
        }
        .padding(.horizontal)
    }
}

struct TweetRow_Previews: PreviewProvider {
    static var previews: some View {
        TweetRow(
            tweet: Tweet(
                id: 4,
                username: "@harmony",
                nickname: "Aimee Harmony",
                created: "23/06/2019",
                message: "Umami slow-carb unicorn narwhal tousled, you probably haven't heard of them lyft irony mlkshk vexillologist. ",
                message_image: "image",
                replies: 33,
                retweets: 134,
                favorited: 400,
                avatar_image: "avatar_3"
            )
        )
    }
}
