//
//  EventView.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/20.
//

import SwiftUI


struct EventView: View {
    
    @EnvironmentObject var eventListVM: EventListViewModel
    @State var showForm = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        Section(header: Text("熱門活動")) {
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(eventListVM.eventViewModels) { eventViewModel in
                                        NavigationLink {
                                            EventDetailView(eventViewModel: eventViewModel)
                                        } label: {
                                            EventBlockView(eventViewModel: eventViewModel)
                                        }                                }
                                }
                            }
                        }
                        .listRowBackground(Color.clear)

                        
                        Section(header: Text("所有活動")) {
                            ForEach(eventListVM.eventViewModels) { eventViewModel in
                                NavigationLink {
                                    EventDetailView(eventViewModel: eventViewModel)
                                } label: {
                                    EventCardView(eventViewModel: eventViewModel)
                                }
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                    
                    
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            showForm.toggle()
                            
                        } label: {
                            Image(systemName: "plus")
                                .font(.largeTitle)
                                .frame(width: 70, height: 70)
                                .background(Color.accentColor)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                                .padding(20)
                        }

                    }
                }
            }
            .sheet(isPresented: $showForm) { AddingEventView(eventListVM: EventListViewModel()) }
            .navigationTitle("所有活動")
        }
        
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
            .environmentObject(EventListViewModel())
        
    }
}

