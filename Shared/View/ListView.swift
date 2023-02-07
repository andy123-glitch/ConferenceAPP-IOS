//
//  ListView.swift
//  Projet (iOS)
//
//  Created by azerot andy on 23/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        /*Button("Show Sheet") {
         showingSheet.toggle()
         }
         .sheet(isPresented: $showingSheet) {
         SheetView()
         }*/
        NavigationView {
            List{
                ForEach(1..<15) { i in
                    RowView()
                }
            }.navigationTitle("Restaurants")
            .navigationBarItems(trailing: Button("Filter by",action: {}))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
