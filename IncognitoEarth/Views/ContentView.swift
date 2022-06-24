//
//  ContentView.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/19.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    
    var body: some View {
        if logStatus{
            Home()
        }
        else{
            LoginPage()
                .navigationBarHidden(true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EventViewModel(event: EventModel(name: "a", description: "a", date: Date(), organiser: "a", type: "a", location: "a")))
    }
}

