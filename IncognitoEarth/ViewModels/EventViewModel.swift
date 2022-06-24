//
//  EventViewModel.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/21.
//

import Foundation
import Combine
import Firebase

class EventViewModel: ObservableObject, Identifiable {
    
    private let eventRepository = EventRepository()
    @Published var event: EventModel
    
    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(event: EventModel) {
        self.event = event
        
        // set up binding for story between the stories id and the viewmodels
        //id then store object in cancellables so it can be canceled later
        $event
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    private var db = Firestore.firestore()
    
//    func fetchData() {
//        db.collection("events").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//
//            self.events = documents.map { (queryDocumentSnapshot) -> EventModel in
//                let data = queryDocumentSnapshot.data()
//                let name = data["name"] as? String ?? ""
//                let description = data["description"] as? String ?? ""
//                let date = data["date"] as? String ?? ""
//                let organiser = data["organiser"] as? String ?? ""
//                let type = data["type"] as? String ?? ""
//                let location = data["location"] as? String ?? ""
//
//                return EventModel(name: name, description: description, date: date, organiser: organiser, type: type, location: location)
//            }
//        }
//    }
    
    func getEvent() {
        eventRepository.get()
    }
    
    func createEvent(_ event: EventModel) {
        eventRepository.createEvent(event)
    }
    
//    func createEvent(newEvent: EventModel) {
//            let db = Firestore.firestore()
//            let docRef = db.collection("events").document("PoutineFiesta")
//
//                    docRef.setData(newEvent) { error in
//                        if let error = error {
//                            print("Error writing document: \(error)")
//                        } else {
//                            print("Document successfully written!")
//                        }
//                    }
//    }
    
//    func addData(name: String, description: String, date: String, organiser: String, type: String, location: String) {
//            do {
//                _ = try db.collection("events").addDocument(data: ["name": name])
//
//            }
//            catch {
//                print(error.localizedDescription)
//            }
//        }
}
