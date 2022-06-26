//
//  EventRowView.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/20.
//

import SwiftUI

struct EventCardView: View {
    
    var eventImg : UIImage = UIImage(named: "defaultImage")!
    
    var eventViewModel: EventViewModel
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(#colorLiteral(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)))
                .shadow(radius: 5)
            HStack {
                VStack{
                    if eventViewModel.event.eventImage != nil {
                        Image(uiImage: UIImage(data: eventViewModel.event.eventImage!) ?? eventImg)
                            .resizable()
//                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 90)
                            .clipped()
                            .cornerRadius(20)
                    } else {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray)
                            .frame(width: 120, height: 90)
                    }
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text(dateFormatter.string(from: eventViewModel.event.date))
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)))
                    VStack(alignment: .leading) {
                        Text(eventViewModel.event.name)
                            .font(.title2)
                            .fontWeight(.bold)

                        Text(eventViewModel.event.description)
                            .font(.caption)
                            .lineLimit(1)
                    }
                    HStack(alignment: .bottom) {
                        Image(systemName: "mappin.and.ellipse")
                            .imageScale(.small)
                        Text(eventViewModel.event.location)
                            .font(.caption)
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)))
                    
                    
                }
                .multilineTextAlignment(.leading)
                .padding(1)
                Spacer()
            }
            .padding(8)
            
        }
        .frame(width: 320, height: 120)
    }
}


struct EventCardView_Previews: PreviewProvider {

    static var event1 = EventModel(name: "路面維護", description: "aaaaaaaa", date: Date(), organiser: "Poter", type: "aaa", location: "KH")

    static var previews: some View {
        EventCardView(eventViewModel: EventViewModel(event: event1))
            .previewLayout(.sizeThatFits)
        EventView()
            .environmentObject(EventListViewModel())

    }
}
