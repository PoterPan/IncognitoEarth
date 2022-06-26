//
//  Home.swift
//  iosProject
//
//  Created by funghi on 2022/6/7.
//

import SwiftUI
import Firebase

struct Home: View {
    @AppStorage("log_status") var logStatus: Bool = false
    
    var body: some View {
        TabView {
            LoginStatusView().tabItem{
                NavigationLink(destination: LoginStatusView()) {
                    Image(systemName: "flag.fill")
                    Text("LoginStatus")
                }
            }
            
            EventView().tabItem{
                NavigationLink(destination: EventView()) {
                    Image(systemName: "flag.fill")
                    Text("活動頁面")
                }
            }
            
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(EventListViewModel())
    }
}
