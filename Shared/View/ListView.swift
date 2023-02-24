//
//  ListView.swift
//  Projet (iOS)
//
//  Created by azerot andy on 23/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel = ConferenceViewModel()
    
    @State private var showingSheet = false
    @State var cafeId =  ""
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .success(let cafes):
                NavigationView {
                    List{
                        ForEach(cafes.records, id: \.self) { cafe in
                            RowView(cafe: cafe)
                                .onTapGesture {
                                    cafeId = cafe.id
                                    showingSheet.toggle()
                                }
                        } .sheet(isPresented: $showingSheet) {
                            SheetView(cafeId: cafeId)
                        }
                    }.navigationTitle("Restaurants")
                    .navigationBarItems(trailing: Button("Filter by",action: {}))
                }
            case .loading:
                ProgressView()
            default:
                EmptyView()
            }
        }
        .task {
            await viewModel.getCafes()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
