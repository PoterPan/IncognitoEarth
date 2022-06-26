//
//  EventBlockView.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/24.
//

import SwiftUI

struct EventBlockView: View {
    
    var eventImg : UIImage = UIImage(named: "defaultImage")!
    
    var eventViewModel: EventViewModel
    
    var body: some View {
        ZStack {
            VStack{
                if eventViewModel.event.eventImage != nil {
                    Image(uiImage: UIImage(data: eventViewModel.event.eventImage!) ?? eventImg)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 180, height: 120)
                        .clipped()
                    //                        .scaledToFit()
                        .cornerRadius(20)
                } else {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray)
                }
            }
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
