//
//  EventView.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/20.
//

import SwiftUI


struct EventView: View {
    
    @EnvironmentObject var eventListVM: EventListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("熱門活動")) {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(eventListVM.eventViewModels) { eventViewModel in
                                    EventBlockView(eventViewModel: eventViewModel)
                                }
                            }
                        }
                    }
                    .listRowBackground(Color.clear)

                    
                    Section(header: Text("所有活動")) {
                        ForEach(eventListVM.eventViewModels) { eventViewModel in
                            EventCardView(eventViewModel: eventViewModel)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                
                
            }
            .onAppear() {
                //                self.eventViewModel.fetchData()
            }
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
