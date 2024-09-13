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
    @ListState(
        From<Selecta>(),
        OrderBy<NSManagedObject>(.ascending("moniker")),
        in: DataStackManager.shared.dataStack) var selectas: ListSnapshot<Selecta>
    var body: some View {
        List {
            ForEach(objectIn: self.selectas) { selecta in
                Text("\(selecta.moniker ?? "Unknown")")
            }
        }
        Text("No display has been possible yet.")
    }
}

#Preview {
    ContentView()
}
