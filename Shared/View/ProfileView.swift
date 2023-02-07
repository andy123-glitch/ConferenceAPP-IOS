//
//  ProfileView.swift
//  Projet (iOS)
//
//  Created by azerot andy on 23/01/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var age: String = ""
    @State var bio: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Personal information")){
                    TextField("Firstame",text: $firstName)
                    TextField("LastName",text: $lastName)
                    TextField("Age",text: $age)
                    TextField("Bio",text: $bio)
                }
                Button {
                    showAlert = true
                } label: {
                    Text("Save")
                        .frame(width: 280, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding()
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Saved"))
                }
            }.navigationTitle("Profile")
            
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

