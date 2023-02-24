//
//  ConferenceViewModel.swift
//  Projet (iOS)
//
//  Created by marchal valentin on 07/02/2023.
//

import Foundation

@MainActor
class ConferenceViewModel: ObservableObject {
    enum State {
        case notAvailable
        case loading
        case success(data: CafeResponse)
        case failed(error: Error)
    }
    
    enum CafeDataState {
        case notAvailable
        case loading
        case success(data: Cafe)
        case failed(error: Error)
    }
    enum UserDataState {
        case notAvailable
        case loading
        case success(data: UserResponse)
        case failed(error: Error)
    }
    
    enum UsersInCafeState {
        case notAvailable
        case loading
        case success(data: UserResponse)
        case failed(error: Error)
    }
    
    
    
    @Published var state:State = .notAvailable
    @Published var dataState:CafeDataState = .notAvailable
    @Published var usersCafeState:UsersInCafeState = .notAvailable
    @Published var hasError: Bool = false
    @Published var usersDataState:UserDataState = .notAvailable
    
    private let service = ConferenceService() // A MODIFIER
    
    func getCafes() async {
        self.state = .loading
        self.hasError = false
        do {
            let cafes = try await service.fetchCafes()
            self.state = .success(data: cafes)
        } catch {
            self.state = .failed(error : error)
            self.hasError = true
            print(error)
        }
    }
    
    func getUsers() async {
        self.usersDataState = .loading
        self.hasError = false
        do {
            let users = try await service.fetchUsers()
            self.usersDataState = .success(data: users)
        } catch {
            self.usersDataState = .failed(error : error)
            self.hasError = true
            print(error)
        }
    }
    
    func getCafeData(from id: String) async {
        self.dataState = .loading
        self.hasError = false
        do {
            let cafe = try await service.fetchCafeData(for: id)
            self.dataState = .success(data: cafe)
        } catch {
            self.dataState = .failed(error: error)
            self.hasError = true
            print(error)
        }
    }
    
    func getUsersInCafe(from cafeId: String) async {
        self.usersCafeState = .loading
        self.hasError = false
        do {
            let users = try await service.fetchUsersInCafe(for: cafeId)
            self.usersCafeState = .success(data: users)
        } catch {
            self.usersCafeState = .failed(error: error)
            self.hasError = true
            print(error)
        }
    }
    
    func addUser(lastname:String, firstname:String, age:String, bio:String) {
        service.addUser(lastname: lastname, firstname: firstname, age: age, bio: bio)
    }
    
}
