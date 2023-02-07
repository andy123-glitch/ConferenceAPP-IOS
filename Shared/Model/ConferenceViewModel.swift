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
        case success(data: [Cafe])
        case failed(error: Error)
    }
    
    @Published var state:State = .notAvailable
    @Published var dataState:State = .notAvailable
    @Published var hasError: Bool = false
    
    private let service = ConferenceService() // A MODIFIER
    
    func getCafes(from username: String) async {
        self.state = .loading
        self.hasError = false
        do {
            let followers = try await service.fetchFollowers(for: username)
            self.state = .success(data: followers)
        } catch {
            self.state = .failed(error : error)
            self.hasError = true
            print(error)
        }
    }
}
