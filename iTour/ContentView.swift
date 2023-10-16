//
//  ContentView.swift
//  iTour
//
//  Created by Boris Romão Antunes on 03/10/23.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    // variavel de ambiante que informa o que deve ser salvo no modelContext
    @Environment(\.modelContext) var modelContext
    
    @Query var destinantions: [Destination]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(destinantions){ destinantion in
                    NavigationLink(value: destinantion){
                        VStack(alignment: .leading){
                            Text(destinantion.name)
                                .font(.headline)
                            Text(destinantion.date.formatted(date: .long, time: .standard))
                        }
                    }
                }
                .onDelete(perform: deletDestination)
            }
            .navigationTitle("iTour")
            .listStyle(.sidebar)
            .navigationDestination(for: Destination.self, destination: EditiDestinationView.init)
            .toolbar {
                Button("Add Amostra", action: addSamples)
            }
        }
    }
    
    func addSamples(){
        let rome = Destination(name: "Romar")
        let brazil = Destination(name: "Brasil")
        let japao = Destination(name: "Japão")
        
        // add esse objetos o modelo de dados
        modelContext.insert(rome)
        modelContext.insert(brazil)
        modelContext.insert(japao)
    }
    
    func deletDestination(_ indexSet: IndexSet){
        for index in indexSet{
            let destination = destinantions[index]
            modelContext.delete(destination)
        }
    }

}


#Preview {
    ContentView()
}
