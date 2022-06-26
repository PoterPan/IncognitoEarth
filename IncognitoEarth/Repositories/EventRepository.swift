//
//  EventRepository.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import Combine
import PhotosUI

class EventRepository: ObservableObject {
    private let path: String = "events"
    private let store = Firestore.firestore()
    private let storage = Storage.storage()
   
    @Published var events: [EventModel] = []
    
    var userId = ""

    private let authenticationService = AuthenticationService()
   
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
      authenticationService.$user
        .compactMap { user in
          user?.uid
        }
        .assign(to: \.userId, on: self)
        .store(in: &cancellables)

      authenticationService.$user
        .receive(on: DispatchQueue.main)
        .sink { [weak self] _ in
          self?.get()
        }
        .store(in: &cancellables)
    }
    
    func get(){
        store.collection(path)
            .addSnapshotListener{ querySnapshot, error in
                if let error = error {
                    print("Error getting stories: \(error.localizedDescription)")
                    return
                }
                
                // 5
                self.events = querySnapshot?.documents.compactMap { document in
                    // 6
                    try? document.data(as: EventModel.self)
                } ?? []
                print("data loaded")
            }
    }
    
    func createEvent(_ event: EventModel) {
        let document = store.collection(path).document()
        let eventID = document.documentID
        
        ImageManager.instance.uploadStoryImage(eventID: eventID, image: event.eventImage!) { (_ success: Bool) in
            if success {
                do {
                    var newEvent = event
                    newEvent.userId = self.userId
                    newEvent.organiser = self.userId
                    newEvent.eventId = eventID
                    _ = try self.store.collection(self.path).addDocument(from: newEvent)
                } catch {
                    fatalError("Unable to add card: \(error.localizedDescription).")
                }
                return
                
            } else {
                print("Error uploading post image to firebase")
                return
            }
        }
    }
//
//    func remove(_ story: Story) {
//        guard let storyId = story.storyId else { return }
//        guard let docId = story.id else { return}
//
//        store.collection(path).document(docId).delete { error in
//            if let error = error {
//                print("Unable to remove card: \(error.localizedDescription)")
//            }  else {
//                print("Successfully deleted  story text")
//            }
//        }
//        storage.reference().child("stories/\(storyId)/1").delete { error in
//            if let error = error {
//                print("Unable to delete story image: \(error.localizedDescription)")
//            } else {
//                print("Successfully deleted  story image")
//            }
//        }
//
//    }
//
//    func updateStory(_ story: Story) {
//        guard let storyDocId = story.id else { return }
//
//        ImageManager.instance.uploadStoryImage(storyID: story.storyId ?? "", image: story.storyImage!) { (_ success: Bool) in
//
//            if success {
//                do {
//                    try self.store.collection(self.path).document(storyDocId).setData(from: story)
//                } catch {
//                    fatalError("Unable to add card: \(error.localizedDescription).")
//                }
//              return
//            } else {
//                print("Error uploading post image to firebase")
//                return
//            }
//        }
//    }
//

}
