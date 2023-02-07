//
//  MainView.swift
//  Projet (iOS)
//
//  Created by azerot andy on 23/01/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            MapView()
                .tabItem{
                    Image(systemName: "map")
                    Text("Map")
                }
            ListView()
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("List")
                }
            ProfileView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Profie")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
