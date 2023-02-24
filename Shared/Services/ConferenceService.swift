//
//  ConferenceService.swift
//  Projet (iOS)
//
//  Created by marchal valentin on 07/02/2023.
//

import Foundation

struct ConferenceService {
    enum ConferenceError: Error {
        case failed
        case failedToDecode
        case invalidStatusCode
        case invalidUserName
    }
    
    func fetchCafes() async throws -> CafeResponse {
        let baseURL = "http://www-etu.iut-bm.univ-fcomte.fr/~vmarcha5/api/cafe/read.php"
        guard let url = URL(string: baseURL) else {
            throw ConferenceError.invalidUserName
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ConferenceError.invalidStatusCode
        }
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(CafeResponse.self, from: data)
        return decodedData
    }
    
    func fetchCafeData(for id: String) async throws -> Cafe {
        let baseURL = "http://www-etu.iut-bm.univ-fcomte.fr/~vmarcha5/api/cafe/read_one.php?id=\(id)"
        guard let url = URL(string: baseURL) else {
            throw ConferenceError.invalidUserName
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ConferenceError.invalidStatusCode
        }
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(Cafe.self, from: data)
        return decodedData
    }
    
    func fetchUsersInCafe(for cafeId: String) async throws -> UserResponse {
        let baseURL = "http://www-etu.iut-bm.univ-fcomte.fr/~vmarcha5/api/user/search.php?locationID=\(cafeId)"
        guard let url = URL(string: baseURL) else {
            throw ConferenceError.invalidUserName
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ConferenceError.invalidStatusCode
        }
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(UserResponse.self, from: data)
        return decodedData
    }
    
    func addUser(lastname:String, firstname:String, age:String, bio:String) {
        guard let url = URL(string: "http://www-etu.iut-bm.univ-fcomte.fr/~vmarcha5/api/user/create.php") else { return }
        let body = "lastname=\(lastname)&firstname=\(firstname)&age=\(age)&bio=\(bio)"
        let finalBody = body.data(using: .utf8)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        URLSession.shared.dataTask(with: request){
                    (data, response, error) in
                    print(response as Any)
                    if let error = error {
                        print(error)
                        return
                    }
                    guard let data = data else{
                        return
                    }
                    print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
                    
                }.resume()
    }
}
