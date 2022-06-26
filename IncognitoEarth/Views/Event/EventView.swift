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
//                        Text("熱門活動")
                        Section(header:
                                    Text("熱門活動")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        )
                        {
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(eventListVM.eventViewModels) { eventViewModel in
                                        NavigationLink {
                                            EventDetailView(eventViewModel: eventViewModel)
                                        } label: {
                                            EventBlockView(eventViewModel: eventViewModel)
                                        }
                                        
                                    }
                                }
                            }
                        }
                        .listRowBackground(Color.clear)

                        
                        Section(header:
                                    Text("所有活動")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        )
                        {
                            ForEach(eventListVM.eventViewModels) { eventViewModel in
                                ZStack {
                                    NavigationLink {
                                        EventDetailView(eventViewModel: eventViewModel)
                                    } label: {
                                        EmptyView()
                                    }
                                    .opacity(0.0)
                                    EventCardView(eventViewModel: eventViewModel)

                                }
                                
                            }
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)

                        
                    }
//                    .listStyle(GroupedListStyle())
                    .listStyle(.insetGrouped)
                    
//                    .listRowInsets(EdgeInsets())
//                    .buttonStyle(PlainButtonStyle())
//                    .accentColor(.clear)
//                    .disabled(true)

//                    .buttonStyle(PlainButtonStyle())

                    
                    
                }
                
                //FAB
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            showForm.toggle()
                            
                        } label: {
                            Image(systemName: "plus")
                                .font(.largeTitle)
                                .frame(width: 50, height: 50)
                                .background(Color.accentColor)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                                .padding(20)
                        }

                    }
                }
            }
            .sheet(isPresented: $showForm) { AddingEventView(eventListVM: EventListViewModel()) }
            .navigationTitle("活動總覽")
        }
        
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
            .environmentObject(EventListViewModel())
        
    }
}

