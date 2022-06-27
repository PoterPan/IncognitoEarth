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
        Home()
//        if logStatus{
//            Home()
//        }
//        else{
//            LoginPage()
//                .navigationBarHidden(true)
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

