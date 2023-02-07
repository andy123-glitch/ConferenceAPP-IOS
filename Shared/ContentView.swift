//
//  ContentView.swift
//  Shared
//
//  Created by azerot andy on 23/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State var address = ""
        var body: some View {
            TextEditor(text: $address)
             //   .lineLimit(3, reservesSpace: true)

                .textFieldStyle(.roundedBorder)
                .padding()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
