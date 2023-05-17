//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Dmytro Ivanenko on 09.05.2023.
//

import Foundation

final class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
}
