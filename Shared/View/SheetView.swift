//
//  SheetView.swift
//  Projet (iOS)
//
//  Created by azerot andy on 07/02/2023.
//

import SwiftUI

struct SheetView: View {
    //@Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(red: 0.93, green: 0.91, blue: 0.95)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image("imgtest")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(8)
                    VStack{
                        Text("Info du resto")
                        Button{
                            
                        }label: {
                            Label("Map",systemImage: "map")
                        }.buttonStyle(.bordered)
                    }.padding()
                    Spacer()
                }.padding()
                
                VStack{
                    Text("Infos de la conference")
                    Text("56 participants")
                    Button{}label: {
                        Text("Check in/Check out")
                    }.buttonStyle(.bordered)
                }.frame(width: 250)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding()
                
                NavigationView {
                    List{
                        ForEach(1..<15) { i in
                            Text("sfdsfgg")
                        }
                        
                        .navigationTitle("Liste des participants")
                    }
                }
            }
            
        }
    }
    
}


struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
