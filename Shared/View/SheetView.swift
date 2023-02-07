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
            Color(red: 238/255, green: 234/255, blue: 238/255)
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
                    }.padding(.leading,40)
                    Spacer()
                }.padding()
                
                VStack{
                    Text("Infos de la conference")
                    Text("56 participants")
                    Button{}label: {
                        Text("Check in/Check out")
                    }.buttonStyle(.borderedProminent)
                        .padding()
                }.frame(width: 300)
                    .background(Color(red: 183/255, green: 183/255, blue: 183/255))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding()

                
                NavigationView {
                    List {
                        ForEach(1..<15) { i in
                            Text("Andy,Azerot,22 ans")
                        }
                        .listRowBackground(Color(red: 238/255, green: 234/255, blue: 238/255))
                    }
                    .listStyle(.plain)
                    
                    .background(Color(red: 238/255, green: 234/255, blue: 238/255))
                    .navigationTitle("Liste des participants")
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
