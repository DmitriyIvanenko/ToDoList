//
//  ProfileView.swift
//  ToDoList
//
//  Created by Dmytro Ivanenko on 09.05.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
             .resizable()
             .aspectRatio(contentMode: .fit)
             .foregroundColor(Color.blue)
             .frame(width: 215, height: 125)
             .padding()
         
         VStack(alignment: .leading) {
             HStack {
                 Text("Name: ")
                     .bold()
                 Text(user.name)
             }
             .padding(4)
             
             HStack {
                 Text("Email: ")
                     .bold()
                 Text(user.email)
             }
             .padding(4)
             
             HStack {
                 Text("Member Since: ")
                     .bold()
                 Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
             }
             .padding(4)
         }
         .padding()
         
         Button("Log Out") {
             viewModel.logOut()
         }
         .tint(Color.red)
         .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
