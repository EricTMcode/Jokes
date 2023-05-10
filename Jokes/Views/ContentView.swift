//
//  ContentView.swift
//  Jokes
//
//  Created by Eric on 10/05/2023.
//

import SwiftUI

struct ContentView: View {
    enum JokeType: String, Codable, CaseIterable {
        case general, knock_knock, programming, anime, food, dad
    }
    
    @StateObject var jokeVM = JokeViewModel()
    @State private var showPunchline = false
    @State private var selectedJoke = JokeType.general
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Jokes! 😜")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                .foregroundColor(.white)
                .background(.red)
            
            Group {
                Text("Setup:")
                    .bold()
                    .foregroundColor(.red)
                Text(jokeVM.joke.setup)
                    .animation(.default, value: jokeVM.joke.setup)
                
                Spacer()
                
                if showPunchline {
                    Text("Punchline:")
                        .bold()
                        .foregroundColor(.red)
                    Text(jokeVM.joke.punchline)
                }
                
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
            if showPunchline {
                Button("Get Joke") {
                    showPunchline.toggle()
                    jokeVM.urlString = "https://joke.deno.dev/type/\(formatJokeType(jokeType: selectedJoke))/1"
                    Task {
                        await jokeVM.getData()
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity)
            } else {
                Button("Show Punchline") {
                    showPunchline.toggle()
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity)
            }
            
            HStack {
                Text("Joke Type")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.red)
                
                Spacer()
                Picker("", selection: $selectedJoke) {
                    ForEach(JokeType.allCases, id: \.self) { jokeType in
                        Text(formatJokeType(jokeType:jokeType))
                    }
                }
            }
            .padding()

        }
        .task {
            jokeVM.urlString = "https://joke.deno.dev/type/\(formatJokeType(jokeType: selectedJoke))/1"
            await jokeVM.getData()
        }
    }
    
    func formatJokeType(jokeType: JokeType) -> String {
        if jokeType == .knock_knock {
            return "knock-knock"
        } else {
            return jokeType.rawValue
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
