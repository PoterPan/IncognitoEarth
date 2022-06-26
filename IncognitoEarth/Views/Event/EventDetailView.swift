//
//  EventDetailView.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/26.
//

import SwiftUI

struct EventDetailView: View {
    
    var eventImg : UIImage = UIImage(named: "defaultImage")!
    
    var eventViewModel: EventViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View {
        Button(action: { self.presentationMode.wrappedValue.dismiss() } )
        {
            ZStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .opacity(0.5)
                    .foregroundColor(Color.accentColor)
                    
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
            }
        }
    }
    
    var body: some View {
        ZStack {
            VStack{
                if eventViewModel.event.eventImage != nil {
                    Image(uiImage: UIImage(data: eventViewModel.event.eventImage!) ?? eventImg)
                        .resizable()
                    //                            .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.size.width, height: 350)
                        .clipped()
                        .cornerRadius(40)
                    
                } else {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(.gray)
                        .frame(height: 350)
                    
                }
                EventDetailCardView(eventViewModel: eventViewModel)
                    .padding(.bottom, -80)
                    .offset(y: -80)
                HStack {
                    VStack() {
                        Text(eventViewModel.event.description)
                            .multilineTextAlignment(.leading)
                            
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 30.0)
                    Spacer()
                }
                
                Spacer()
                
                HStack{
                    LikeButton(btnAction: handleButttonTap)
                    Spacer(minLength: 15)
//                    Image(systemName: "heart.fill")
//                        .font(.system(size: 25))
//                        .frame(width: 60, height: 60)
//                        .foregroundColor(Color.mint)
//                        .background(Color.white)
//                        .clipShape(Circle())
//                        .shadow(radius: 5)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color.accentColor)
                        Text("Join!")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
                .frame(height: 65)
                .padding()
                .padding(.horizontal, 5)
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                btnBack
            }
        }
    }
    
    private  func handleButttonTap(){
        print("Like Button tapped")
    }
}

struct EventDetailView_Previews: PreviewProvider {
    
    static var event1 = EventModel(name: "路面維護", description: "aaaaaaaa", date: Date(), organiser: "Poter", type: "aaa", location: "KH")
    
    static var previews: some View {
        EventDetailView(eventViewModel: EventViewModel(event: event1))
        EventView()
            .environmentObject(EventListViewModel())
    }
}


