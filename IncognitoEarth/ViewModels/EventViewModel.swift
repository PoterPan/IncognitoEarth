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
    
    
    func createEvent(_ event: EventModel) {
        eventRepository.createEvent(event)
    }
    
}
