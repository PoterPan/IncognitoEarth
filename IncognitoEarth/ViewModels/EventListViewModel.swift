//
//  EventListViewModel.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/24.
//

import Foundation
import Combine


class EventListViewModel: ObservableObject {
  // 1
  @Published var eventViewModels: [EventViewModel] = []
  // 2
  private var cancellables: Set<AnyCancellable> = []

  // 3
  @Published var eventRepository = EventRepository()

  init() {
    // 1
    eventRepository.$events.map { events in
      events.map(EventViewModel.init)
    }
    // 2
    .assign(to: \.eventViewModels, on: self)
    // 3
    .store(in: &cancellables)
  }

  // 4
  func create(_ event: EventModel) {
    eventRepository.createEvent(event)
  }
}
