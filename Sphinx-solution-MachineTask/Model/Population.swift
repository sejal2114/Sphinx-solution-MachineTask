//
//  Population.swift
//  Sphinx-solution-MachineTask
//
//  Created by Sejal on 04/03/23.
//

import Foundation


// MARK: - Welcome
struct PopulationRoot: Codable {
    let data: [Population]
}

// MARK: - Datum
struct Population: Codable {
    let idNation, nation: String
    let idYear: Int
    let year: String
    let population: Int
    let slugNation: String

    enum CodingKeys: String, CodingKey {
        case idNation = "ID Nation"
        case nation = "Nation"
        case idYear = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugNation = "Slug Nation"
    }
}
