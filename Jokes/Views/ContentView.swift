//
//  ContentView.swift
//  Jokes
//
//  Created by Eric on 10/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Jokes! 😜")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                .foregroundColor(.white)
                .background(.red)

            VStack(alignment: .leading) {
                Text("Setup:")
                    .bold()
                    .foregroundColor(.red)
                Text("Why does Norway Have barcodes on their battleships ? ")
            }
            .font(.largeTitle)
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}