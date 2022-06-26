//
//  eventModel.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/20.
//

import Foundation
import FirebaseFirestoreSwift


struct EventModel: Identifiable, Codable {
    @DocumentID var id: String?
    let name: String
    let description: String
    var userId: String?
    var organiser: String?
    var eventId: String?
    var eventImage: Data?
    let date: Date
    let type: String
    let location: String
    
}
