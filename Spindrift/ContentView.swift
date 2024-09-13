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
    @StateObject private var viewModel: SelectaViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: SelectaViewModel(dataStack: dataStack))
    }
    
    var body: some View {
        List(viewModel.selectas, id: \.uniqueID) { selecta in
            Text("\(selecta.firstName) \(selecta.lastName) (\(selecta.moniker))")
        }
    }
}

#Preview {
    ContentView()
}
