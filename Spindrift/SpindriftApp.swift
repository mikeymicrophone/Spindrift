//
//  SpindriftApp.swift
//  Spindrift
//
//  Created by Michael Schwab on 6/26/24.
//

import SwiftUI
import os
import CoreStore

@main
struct SpindriftApp: App {
    var dataStack: DataStack!
//    var reactiveStack: DataStack.ReactiveNamespace
    
    init() {
        do {
            dataStack = DataStack(
                CoreStoreSchema(
                    modelVersion: "V1",
                    entities: [
                        Entity<MICSelecta>("MICSelecta"),
                        Entity<MICPerformance>("MICPerformance")
                        // Add other entities here if you have them
                    ]
                )
            )
//            reactiveStack = dataStack.reactive
            try dataStack.addStorageAndWait()
        } catch {
            os_log("\(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView() //selectas: ListPublisher<MICSelecta>(From<MICSelecta>(), in: dataStack))
                .environment(\.dataStack, dataStack)
            Button(action: addSelecta, label: {
                Text("Add Claude")
            })
        }
    }
    
    func addSelecta() {
        dataStack.perform(
            asynchronous: { transaction in
                let newSelecta = transaction.create(Into<MICSelecta>())
                
                // Set properties of newSelecta
                newSelecta.firstName = "Barclay"
                newSelecta.lastName = "Crenshaw"
                newSelecta.moniker = "Claude VonStroke"
                
                // If you have relationships, you can set them here too
            },
            completion: { result in
                switch result {
                case .success:
                    print("Successfully inserted a new MICSelecta")
                case .failure(let error):
                    print("Failed to insert MICSelecta: \(error)")
                }
            }
        )
    }
}
