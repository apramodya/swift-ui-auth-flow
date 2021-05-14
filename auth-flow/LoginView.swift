//
//  LoginView.swift
//  auth-flow
//
//  Created by Pramodya Abeysinghe on 2021-05-14.
//

import SwiftUI
import Combine

struct LoginView: View {
    @ObservedObject var vm = LoginViewModel()
    @State var showAlert = false
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 40)
            
            VStack {
                TextField("Email", text: $vm.email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            VStack {
                SecureField("Password", text: $vm.password)
                    .textContentType(.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            Button("Login") {
                showAlert = !vm.loginUser()
            }
            .padding()
            .frame(width: 100, height: 40, alignment: .center)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(vm.errorMessage))
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
