//
//  InputView.swift
//  IGEM Software
//
//  Created by Kyle Wang on 2022/8/25.
//

import SwiftUI

struct InputView: View {
    @State var N_rate: Double?
    @State var P_rate: Double?
    @State var message = ""
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Phospate Concentration", value: $P_rate, format: .number)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.blue)
                    .padding()

                TextField("Nitrogen Concentration", value: $N_rate, format: .number)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.blue)
                    .padding()

                Button(action:{
                    if let N_rate = N_rate,
                       let P_rate = P_rate {
                        
                        if 0.13 < N_rate, N_rate < 1.4, 3 < P_rate, P_rate < 11 {
                            message += "oligotrophic\n"
                        }
                        
                        else if 0.31 < N_rate, N_rate < 0.39, 11 < P_rate, P_rate < 16 {
                            message += "oligotrophic\n"
                        }
                        
                        else if 0.31 < N_rate, N_rate < 0.36, 16 < P_rate, P_rate < 18 {
                            message += "oligotrophic\n"
                        }
                        
                        else if 1.4 < N_rate, N_rate < 6.1, 0 < P_rate, P_rate < 16 {
                            message += "mesotrophic\n"
                        }
                        
                        else if 0.39 < N_rate, N_rate < 1.4, 11 < P_rate, P_rate < 96 {
                            message += "mesotrophic\n"
                        }
                        
                        else if 0.36 < N_rate, N_rate < 0.39, 16 < P_rate, P_rate < 96 {
                            message += "mesotrophic\n"
                        }
                        
                        else if 0 < N_rate, N_rate < 0.36, 18 < P_rate, P_rate < 96 {
                            message += "mesotrophic\n"
                        }
                        
                        else if 0 < N_rate, N_rate < 0.39, 96 < P_rate, P_rate < 243 {
                            message += "mesotrophic\n"
                        }
                        
                        else if 0 < N_rate, N_rate < 0.39, 243 < P_rate, P_rate < 390 {
                            message += "eutrophic\n"
                        }
                        
                        else if 0.39 < N_rate, N_rate < 1.4, 96 < P_rate, P_rate < 390 {
                            message += "eutrophic\n"
                        }
                        
                        else if 1.4 < N_rate, N_rate < 6.1, 16 < P_rate, P_rate < 390 {
                            message += "eutrophic\n"
                        }
                        
                        else if 6.1 < N_rate {
                            message += "eutrophic\n"
                        }
                        
                        else if 390 < P_rate {
                            message += "eutrophic\n"
                        }
                        
                        else {
                            message += "no eutrophic condition detected"
                        }
                        
                    }

                    
                }, label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.cornerRadius(8))
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                })
                
                Text(message)
                    .font(.largeTitle)
                    .foregroundColor(.green)
                Spacer()
                
                
            }
            //.background(
                
                //LinearGradient(stops: [
                    //Gradient.Stop(color:
                        //Color(red: 0, green: 158/255, blue: 96/255), location: 0.2),
                    //Gradient.Stop(color:
                                    //Color(red: 0, green: 94/255, blue: 184/255), location: 0.5)
                    
                //], startPoint: .top, endPoint: .bottom)
               
            //)
            .navigationTitle("Calculation")
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
