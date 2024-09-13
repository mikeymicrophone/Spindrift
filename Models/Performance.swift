//
//  MICPerformance.swift
//  Spindrift
//
//  Created by Michael Schwab on 7/5/24.
//

import Foundation
import CoreStore

class Performance: CoreStoreObject {
    @Field.Stored("name")
    var name: String = ""
    
    @Field.Relationship("selecta")
    var selecta: Selecta?
}
