//
//  ContentView.swift
//  IGEM Software
//
//  Created by Kyle Wang on 2022/8/13.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State var presented = false
    @State var selectedIndex = 0
    let icons=["keyboard.chevron.compact.down", "map", "leaf", "gear"]
    @State var showLogin = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack{
//                Spacer().fullScreenCover(isPresented: $presented, content:{
//                    Button(action:{
//                        presented.toggle()
//                    }, label:{
//                        Text("Quit")
//                            .frame(width:50, height:20)
//                            .background(.pink)
//                            .cornerRadius(12)
//                    })
//                })
                switch selectedIndex{
                case 0:
                    InputView()
                case 1:
                    AppMapView()
                case 2:
                    NavigationView {
                        VStack{
                            Text("Fourth Screen")
                        }
                        .navigationTitle("Filter")
                    }
                default:
                    NavigationView {
                        VStack{
                            Text("Fifth Screen")
                            Button {
                                try? Auth.auth().signOut()
                                showLogin = true
                                
                            } label: {
                                Text("sign out")
                            }
                            
                        }
                        .navigationTitle("Setting")
                    }
                }
            }
            Divider()
                .padding(.bottom,10)
            HStack{
                Spacer()
                ForEach(0..<4, id: \.self) {number in
                    Button(action: {
                        
                            self.selectedIndex = number
                        
                    }, label: {
                        
                            Image(systemName: icons[number])
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(selectedIndex == number ? Color(.label) : Color(UIColor.lightGray))
                        
                    })
                    Spacer()
                    
                    
                }
            }
        }
        .fullScreenCover(isPresented: $showLogin) {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

