//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Dmytro Ivanenko on 09.05.2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDtae = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // Get current User ID
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create Model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDtae.timeIntervalSince1970,
                                   createDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        // Save Model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
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
