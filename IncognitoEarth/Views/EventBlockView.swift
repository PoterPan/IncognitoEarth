//
//  EventBlockView.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/24.
//

import SwiftUI

struct EventBlockView: View {
    var eventViewModel: EventViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray)
                .shadow(radius: 5)
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(eventViewModel.event.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    HStack(alignment: .bottom) {
                        Image(systemName: "mappin.and.ellipse")
                            .imageScale(.small)
                        Text(eventViewModel.event.location)
                            .font(.caption)
                    }
                    .foregroundColor(.white)
                }
                .padding(12)
                Spacer()
            }
        }
        .frame(width: 180, height: 120)
    }
}

struct EventBlockView_Previews: PreviewProvider {
    static var event1 = EventModel(name: "路面維護", description: "aaaaaaaa", date: Date(), organiser: "Poter", type: "aaa", location: "KH")

    static var previews: some View {
        EventBlockView(eventViewModel: EventViewModel(event: event1))
            .previewLayout(.sizeThatFits)
        EventView()
            .environmentObject(EventListViewModel())

    }
}
