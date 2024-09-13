//
//  ContentView.swift
//  Spindrift
//
//  Created by Michael Schwab on 6/26/24.
//

import SwiftUI
import CoreStore
import Combine

struct ContentView: View {
    @Environment(\.dataStack) var dataStack
    var selectas: ListPublisher<Selecta>
    
    var body: some View {
        List {
            ListReader(self.selectas) { listSnapshot in
                ForEach(objectIn: listSnapshot) { selecta in
                    Text(String(describing: selecta.firstName))
                }
            }
        }
    }
}
