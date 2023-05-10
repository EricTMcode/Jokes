//
//  ContentView.swift
//  Jokes
//
//  Created by Eric on 10/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var jokeVM = JokeViewModel()
    @State private var showPunchline = false
    
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
            
        }
        .task {
            await jokeVM.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
