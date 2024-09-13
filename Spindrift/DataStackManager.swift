//
//  DataStackManager.swift
//  Spindrift
//
//  Created by Michael Schwab on 9/13/24.
//

import Foundation
import CoreStore
import Combine
import os

class DataStackManager: ObservableObject {
    public static let shared = DataStackManager()
    
    @Published public private(set) var dataStack: DataStack
    
    init() {
        do {
            dataStack = DataStack(
                CoreStoreSchema(
                    modelVersion: "V1",
                    entities: [
                        Entity<Selecta>("Selecta"),
                        Entity<Performance>("Performance")
                        // Add other entities here if you have them
                    ]
                )
            )
            try dataStack.addStorageAndWait()
        } catch {
            os_log("\(error)")
        }
    }
}
