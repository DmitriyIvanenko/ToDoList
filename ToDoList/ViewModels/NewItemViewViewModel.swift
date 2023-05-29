//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Dmytro Ivanenko on 09.05.2023.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDtae = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDtae >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
