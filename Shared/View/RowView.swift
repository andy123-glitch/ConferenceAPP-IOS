//
//  RowView.swift
//  Projet (iOS)
//
//  Created by azerot andy on 23/01/2023.
//

import SwiftUI

struct RowView: View {
    var body: some View {
        HStack {
            Image("imgtest")
                .resizable()
                .scaledToFit()
                .frame(height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Le bistro - 23,6 km")    
                Text("25 participants")
            }
            Spacer()
        }
    }
}


struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView()
    }
}
