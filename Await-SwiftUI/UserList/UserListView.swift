//
//  ContentView.swift
//  Await-SwiftUI
//
//  Created by Navin Rai on 29/05/25.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                List(viewModel.users ?? [], id: \.id) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        HStack {
                            AsyncImage(url: URL(string: user.avatarURL ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            } placeholder: {
                                Circle()
                                    .foregroundColor(.teal)
                            }
                            .frame(width: 50, height: 50)
                            
                            VStack(alignment: .leading) {
                                Text(user.login?.capitalized ?? "")
                                    .font(.headline)
                                Text(user.url ?? "")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .listRowInsets(EdgeInsets())
                .background(Color.white)
                
                if viewModel.isLoading {
                    LoaderView()
                }
            }
            .navigationTitle("Users")
        }
        .task {
            await viewModel.getUser()
        }
        .alert(isPresented: $viewModel.showAlert) {
            return Alert(
                title: Text("Error"),
                message: Text(viewModel.userError?.errorDescription ?? "")
            )
        }
    }
}

#Preview {
    UserListView()
}
