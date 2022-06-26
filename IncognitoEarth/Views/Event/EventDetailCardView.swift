//
//  EventDetailCardView.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/26.
//

import SwiftUI

struct EventDetailCardView: View {
    
    var eventViewModel: EventViewModel
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd' 'HH:mm"
        return formatter
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(#colorLiteral(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)))
                .shadow(radius: 5)
            HStack {
                VStack(alignment: .leading){
                    Text(eventViewModel.event.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(2)

                    Spacer()
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(Color.accentColor)
                            .font(.system(size: 30))
                            .frame(width: 30)
                        Text(dateFormatter.string(from: eventViewModel.event.date))
                    }
                    .padding(2)

                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(Color.accentColor)
                            .font(.system(size: 30))
                            .frame(width: 30)

                        
                        Text(eventViewModel.event.location)
                    }
                    .padding(2)

                    Spacer()
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.orange)
                            .font(.system(size: 30))
                            .frame(width: 30)

                        Text(eventViewModel.event.organiser!)
                        

                    }
                    .padding(2)
                    
                }
                .padding(15)
                .padding(.top, 10)
                .padding(.horizontal, 25.0)
                Spacer()
            }
        }
        .frame(width: 340, height: 240)
    }
}
struct EventDetailCardView_Previews: PreviewProvider {
    
    static var event1 = EventModel(name: "路面維護", description: "aaaaaaaa", organiser: "Poter", date: Date(), type: "aaa", location: "KH")

    static var previews: some View {
        EventDetailView(eventViewModel: EventViewModel(event: event1))


    }
}
