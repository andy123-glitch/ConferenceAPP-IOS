//
//  ListView.swift
//  Projet (iOS)
//
//  Created by azerot andy on 23/01/2023.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        
        NavigationView {
            Form{
                ForEach(1..<15) { i in
                    RowView()
                }
            }.navigationTitle("Restaurants")
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
