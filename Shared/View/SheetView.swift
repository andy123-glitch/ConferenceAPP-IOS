//
//  SheetView.swift
//  Projet (iOS)
//
//  Created by azerot andy on 07/02/2023.
//

import SwiftUI

struct SheetView: View {
    //@Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = ConferenceViewModel()
    
    var cafeId: String
    @State var nUsers: Int = 0
    
    var body: some View {
        VStack{
            switch viewModel.dataState {
            case .success(let cafe):
                ZStack {
                    Color(red: 238/255, green: 234/255, blue: 238/255)
                        .ignoresSafeArea()
                    VStack{
                        HStack{
                            AsyncImage(url: cafe.imageurl) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 90)
                                    .cornerRadius(8)
                            } placeholder: {
                                ProgressView()
                            }
                            VStack{
                                Text(cafe.name)
                                Text(cafe.address)
                                Button{
                                    
                                }label: {
                                    Label("Map",systemImage: "map")
                                }.buttonStyle(.bordered)
                            }.padding(.leading,40)
                            Spacer()
                        }.padding()
                        
                        VStack{
                            Text("Infos de la conference")
                            Text(String(nUsers) + " participants")
                            Button{}label: {
                                Text("Check in / Check out")
                            }.buttonStyle(.borderedProminent)
                                .padding()
                        }.frame(width: 300)
                            .background(Color(red: 183/255, green: 183/255, blue: 183/255))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding()
                        
                        VStack{
                            switch viewModel.usersCafeState {
                            case .success(let users):
                                //nUsers = users.records.count()
                                NavigationView {
                                    List {
                                        ForEach(users.records, id: \.self) { user in
                                            Text(user.firstname + " " + user.lastname + ", " + user.age)
                                        }
                                        
                                        .listRowBackground(Color(red: 238/255, green: 234/255, blue: 238/255))
                                    }
                                    .listStyle(.plain)
                                    
                                    
                                    .background(Color(red: 238/255, green: 234/255, blue: 238/255))
                                    .navigationTitle("Liste des participants ")
                                }
                            default:
                                Text("Personne dans ce café")
                            }
                        }
                        .task {
                            await viewModel.getUsersInCafe(from: cafe.id)
                        }
                        Spacer()
                    }
                    
                }
            case .loading:
                ProgressView()
            default:
                EmptyView()
            }
        }
        .padding(.top, 20)
        .task {
            await viewModel.getCafeData(from: cafeId)
                    
            
        }
        
    }
    
}
    
    
    //struct SheetView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        SheetView()
    //    }
    //}
