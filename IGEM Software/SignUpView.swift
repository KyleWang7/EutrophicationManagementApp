//
//  SignUpView.swift
//  IGEM Software
//
//  Created by Kyle Wang on 2022/8/28.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State var Name = ""
    @State var Email = ""
    @State var Password = ""
    @State var showMainView = false
    @State var showSignUpView = false
    @State var showEmailError = false
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("User Name", text: $Name)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                TextField("Email", text: $Email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $Password)
                
                if showEmailError {
                    Text("The format of the email is incorrect.")
                        .foregroundColor(Color.red)
                    
                }
                
                Button {
                    showEmailError = !isValidEmail(Email)
                    if showEmailError == false{
                        Auth.auth().createUser(withEmail: Email, password: Password) { result, error in
                            guard let user = result?.user,
                                  error == nil else {
                                print(error?.localizedDescription)
                                return
                            }
                            
                            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                            changeRequest?.displayName = Name
                            changeRequest?.commitChanges(completion: { error in
                                guard error == nil else {
                                    print(error?.localizedDescription)
                                    return
                                }
                                showMainView = true
                                print(Auth.auth().currentUser?.email, Auth.auth().currentUser?.displayName)
                            })
                            
                        }
                    }
                } label: {
                    Text("Create".uppercased())
                        .padding()
                }
            }
            .padding()
        }
        .fullScreenCover(isPresented: $showMainView) { //true -> commit
            ContentView()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
