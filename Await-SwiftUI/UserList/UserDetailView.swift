//
//  UserDetailView.swift
//  Await-SwiftUI
//
//  Created by Navin Rai on 29/05/25.
//

import SwiftUI

struct UserDetailView: View {
    let user: UserModel  // Replace `UserModel` with your actual model name

    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: user.avatarURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.teal)
            }
            .frame(width: 120, height: 120)

            Text(user.login ?? "Unknown User")
                .font(.title)
                .bold()

            Text(user.url ?? "No URL")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .navigationTitle("User Details")
    }
}

#Preview {
    UserDetailView(user: UserModel(
        id: 1,
        login: "navinrai",
        nodeID: "MDQ6VXNlcjE=",
        avatarURL: "https://avatars.githubusercontent.com/u/1?v=4",
        gravatarID: "",
        url: "https://api.github.com/users/navinrai",
        htmlURL: "https://github.com/navinrai",
        followersURL: "https://api.github.com/users/navinrai/followers",
        followingURL: "https://api.github.com/users/navinrai/following{/other_user}",
        gistsURL: "https://api.github.com/users/navinrai/gists{/gist_id}",
        starredURL: "https://api.github.com/users/navinrai/starred{/owner}{/repo}",
        subscriptionsURL: "https://api.github.com/users/navinrai/subscriptions",
        organizationsURL: "https://api.github.com/users/navinrai/orgs",
        reposURL: "https://api.github.com/users/navinrai/repos",
        eventsURL: "https://api.github.com/users/navinrai/events{/privacy}",
        receivedEventsURL: "https://api.github.com/users/navinrai/received_events",
        type: "User",
        siteAdmin: false
    ))
}
