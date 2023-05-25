//
//  LogInViewViewModel.swift
//  ToDoList
//
//  Created by Dmytro Ivanenko on 09.05.2023.
//

import FirebaseAuth
import Foundation

final class LogInViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func logIn() {
        guard validate() else {
            return
        }
        // Try to Log In
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
   private func validate() -> Bool {
       errorMessage = ""
       guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
             !password.trimmingCharacters(in: .whitespaces).isEmpty else {
           errorMessage = "Please fill in all fields"
           return false
       }
       guard email.contains("@") && email.contains(".") else {
           errorMessage = "Please fill in all fields"
           return false
       }
       return true
    }
}
