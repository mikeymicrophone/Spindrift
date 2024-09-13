//
//  MICSelecta.swift
//  Spindrift
//
//  Created by Michael Schwab on 6/26/24.
//

import Foundation
import CoreStore

class MICSelecta: CoreStoreObject {
    @Field.Stored("uniqueID")
    var uniqueID: String = UUID().uuidString
    
    @Field.Stored("firstName")
    var firstName: String?
    
    @Field.Stored("lastName")
    var lastName: String?
    
    @Field.Stored("moniker")
    var moniker: String?
    
    @Field.Relationship("performances", inverse: \.$selecta)
    var performances: Set<MICPerformance>
}
