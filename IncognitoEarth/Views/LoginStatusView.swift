//
//  LoginStatutsView.swift
//  IncognitoEarth
//
//  Created by Poter Pan on 2022/6/21.
//

import SwiftUI
import Firebase


struct LoginStatusView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                if logStatus{
                    Text("Logged In")
                    
                    Button("Logut"){
                        try? Auth.auth().signOut()
                        logStatus = false
                    }
                }
                else{
                    Text("Came as Guest")
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Home")
        }
        
    }
}

struct LoginStatutsView_Previews: PreviewProvider {
    static var previews: some View {
        LoginStatusView()
    }
}
