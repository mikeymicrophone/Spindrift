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
    
    init() {
        do {
            dataStack = DataStack(
                CoreStoreSchema(
                    modelVersion: "V1",
                    entities: [
                        Entity<Selecta>("Selecta"),
                        Entity<Performance>("Performance")
                    ]
                )
            )
            try dataStack.addStorageAndWait()
        } catch {
            os_log("\(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.dataStack, dataStack)
            Button(action: addSelecta, label: {
                Text("Add Claude")
            })
        }
    }
    
    func addSelecta() {
        dataStack.perform(
            asynchronous: { transaction in
                let newSelecta = transaction.create(Into<Selecta>())
                
                // Set properties of newSelecta
                newSelecta.firstName = "Barclay"
                newSelecta.lastName = "Crenshaw"
                newSelecta.moniker = "Claude VonStroke"
                
                // If you have relationships, you can set them here too
            },
            completion: { result in
                switch result {
                case .success:
                    print("Successfully inserted a new Selecta")
                case .failure(let error):
                    print("Failed to insert Selecta: \(error)")
                }
            }
        )
    }
}
