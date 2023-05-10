//
//  Joke.swift
//  Jokes
//
//  Created by Eric on 10/05/2023.
//

import Foundation

struct Joke: Codable, Identifiable {
    var id: Int
    var type: String
    var setup: String
    var punchline: String
}
