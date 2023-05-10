//
//  JokeViewModel.swift
//  Jokes
//
//  Created by Eric on 10/05/2023.
//

import Foundation

class JokeViewModel: ObservableObject {
    @Published var joke = Joke()
    
    var urlString = "https://joke.deno.dev"
    
    func getData() async {
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let joke = try? JSONDecoder().decode(Joke.self, from: data) else {
                print("😡 JSON ERROR: Could not decode returned JSON data.")
                return
            }
            self.joke = joke
        } catch {
            print("😡 ERROR: Could not get data from \(urlString)")
        }
    }
}
