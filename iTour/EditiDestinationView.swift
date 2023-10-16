//
//  EditiDestinationView.swift
//  iTour
//
//  Created by Boris Romão Antunes on 04/10/23.
//

import SwiftUI
import SwiftData

struct EditiDestinationView: View {
    @Bindable var destination: Destination
    
    var body: some View {
        Form{
            Section("Nomes"){
                TextField("Nome", text: $destination.name)
            }
            Section("Descrição"){
                TextEditor(text: $destination.details)
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .topTrailing)
            }
            
            DatePicker("Data", selection: $destination.date)
                    .datePickerStyle(.compact)

            
            Section("Prioridade"){
                Picker("Prioridade", selection: $destination.priority) {
                    Text ("Meh" ).tag(1)
                    Text ("Maybe" ).tag(2)
                    Text ("Must").tag (3)
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Editi Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let conteiner = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "Examplo de Lugar", details: "Example details go here and will automatically expand vertically")
       return EditiDestinationView(destination: example)
            .modelContainer(conteiner)
    } catch {
        fatalError("falha para criar o conteiner")
    }
}

