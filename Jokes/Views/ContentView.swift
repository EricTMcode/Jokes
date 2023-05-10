//
//  ContentView.swift
//  Jokes
//
//  Created by Eric on 10/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var jokeVM = JokeViewModel()
    
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
                
                Text("Punchline:")
                    .bold()
                    .foregroundColor(.red)
                Text(jokeVM.joke.punchline)
                
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
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
