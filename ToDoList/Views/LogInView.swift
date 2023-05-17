//
//  LogInView.swift
//  ToDoList
//
//  Created by Dmytro Ivanenko on 09.05.2023.
//

import SwiftUI

struct LogInView: View {
    @StateObject var viewModel = LogInViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things done",
                           angle: 15,
                           background: .pink)
                
                // Login form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log in",
                             background: .blue) {
                        // Log In
                    }
                }
                .offset(y: -50)
                
                //Create Account
                VStack {
                    Text("New around Here")
                    NavigationLink("Create An Account" ,destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
