//
//  LoginViewModel.swift
//  iosProject
//
//  Created by funghi on 2022/6/7.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showError: Bool = false
    @Published var errorMsg: String = ""
    
    @AppStorage("log_status") var logStatus: Bool = false
    
    func loginUser()async throws{
        let _ = try await Auth.auth().signIn(withEmail: email, password: password)
        logStatus = true
    }
}
