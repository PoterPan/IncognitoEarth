//
//  IncognitoEarthApp.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/19.
//

import SwiftUI
import Firebase

@main
struct IncognitoEarthApp: App {
    init() {
        FirebaseApp.configure()
        
    }
    
//    @StateObject var eventViewModel: EventViewModel = EventViewModel(event: EventModel(name: "a", description: "a", date: Date(), organiser: "a", type: "a", location: "a"))
    @StateObject var eventListVM = EventListViewModel()

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(eventListVM)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        AuthenticationService.signIn()

        return true
    }
}
