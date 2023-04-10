//
//  NewTweet.swift
//  TwitterDemo
//
//  Created by Māris Lakšs on 10/04/2023.
//

import SwiftUI

struct NewTweetView: View {
    @Binding var isPresented: Bool
    @State private var tweetText = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Button(action: {
                    self.isPresented = false
                }) {
                    Text("Cancel")
                }
                Spacer()
                Button(action: {
                    print("Tweet posted: \(tweetText)")
                    self.isPresented = false
                }) {
                    Text("Tweet")
                        .bold()
                }
            }
            .padding(.horizontal)

            Divider()

            HStack {
                Image("oval")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

                TextEditor(text: $tweetText)
                    .frame(minHeight: 100)
                    .padding(.horizontal, 8)
            }
            .padding(.horizontal)
        }
        .navigationBarTitle(Text("New Tweet"))
    }
}

struct NewTweet_Previews: PreviewProvider {
    @State static var isPresented = true

    static var previews: some View {
        NewTweetView(isPresented: $isPresented)
    }
}
