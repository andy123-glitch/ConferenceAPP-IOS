//
//  RowView.swift
//  Projet (iOS)
//
//  Created by azerot andy on 23/01/2023.
//

import SwiftUI

struct RowView: View {
    var cafe: Cafe
    var body: some View {
        HStack {
            AsyncImage(url: cafe.imageurl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 90)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
            }
                
            
            VStack(alignment: .leading, spacing: 5) {
                Text(cafe.name)
                Text(cafe.address)
            }
            Spacer()
        }
    }
}

