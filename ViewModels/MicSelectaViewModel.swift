//
//  MicSelectaViewModel.swift
//  Spindrift
//
//  Created by Michael Schwab on 8/16/24.
//

import Foundation
import CoreStore
import Combine
import SwiftUI

class SelectaViewModel: ObservableObject {
    @Published var selectas: [MICSelecta] = []
    private var cancellable: AnyCancellable?
    private var dataStack: DataStack
    
    init(dataStack: DataStack) {
        self.dataStack = dataStack
        fetchSelectas()
    }
    
    private func fetchSelectas() {
        let publisher = dataStack.listPublisher(
            From<MICSelecta>()
        )
        
        cancellable = publisher.reactive
            .snapshot(emitInitialValue: true)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Failed to fetch selectas: \(error)")
                    }
                },
                receiveValue: { (snapshot: ListSnapshot<MICSelecta>) in
                    self.selectas = snapshot.objects
                }
            )
    }
}
