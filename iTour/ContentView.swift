//
//  ContentView.swift
//  iTour
//
//  Created by Boris Romão Antunes on 03/10/23.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var destinantions: [Destination]
    var body: some View {
        NavigationStack{
            List{
                ForEach(destinantions){ destinantion in
                    VStack(alignment: .leading){
                        Text(destinantion.name)
                            .font(.headline)
                        Text(destinantion.date.formatted(date: .long, time: .standard))
                    }
                }
            }
            .navigationTitle("iTour")
            .toolbar {
                Button("Add Amostra", action: addSamples)
            }
        }
    }
    
    func addSamples(){
        let rome = Destination(name: "Romar")
        let brazil = Destination(name: "Brasil")
        let japao = Destination(name: "Japão")
    }
}

#Preview {
    ContentView()
}
