//
//  LoginView.swift
//  IGEM Software
//
//  Created by Kyle Wang on 2022/8/28.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var Name = ""
    @State var Email = ""
    @State var Password = ""
    @State var showMainView = false
    @State var showSignUpView = false
    @State var errorMessage: String?
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Email", text: $Email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                SecureField("Password", text: $Password)
                
                Text(errorMessage ?? "")
                    .foregroundColor(Color.red)
            
                
                Button {
                        Auth.auth().signIn(withEmail: Email, password: Password) { result, error in
                            guard error == nil else {
                                print(error?.localizedDescription)
                                errorMessage = error?.localizedDescription
                                return
                            }
                            showMainView = true
                        }
                    
                } label: {
                    Text("Sign in".uppercased())
                        .padding()
                }
                
                Button {
                    showSignUpView = true
                } label: {
                    Text("Create An Account".uppercased())
                        .padding()
                }

                
                
            }
            .padding()
      
        }
        .fullScreenCover(isPresented: $showSignUpView) { //true -> commit
            SignUpView()
        }
        .fullScreenCover(isPresented: $showMainView) { //true -> commit
            ContentView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
