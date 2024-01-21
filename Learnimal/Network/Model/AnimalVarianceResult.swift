//
//  AnimalVariance.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 20/01/24.
//

import Foundation

struct VarianceResult: Codable {
    let name: String
    let taxonomy: Taxonomy?
    let locations: [String]?
    let characteristics: Characteristics?
}

struct Taxonomy: Codable {
    let kingdom: String?
    let phylum: String?
    let `class`: String?
    let order: String?
    let family: String?
    let genus: String?
    let scientificName: String?
}

struct Characteristics: Codable {
    let prey: String?
    let nameOfYoung: String?
    let groupBehavior: String?
    let estimatedPopulationSize: String?
    let biggestThreat: String?
    let mostDistinctiveFeature: String?
    let gestationPeriod: String?
    let habitat: String?
    let diet: String?
    let averageLitterSize: String?
    let lifestyle: String?
    let commonName: String?
    let numberOfSpecies: String?
    let location: String?
    let slogan: String?
    let group: String?
    let color: String?
    let skinType: String?
    let topSpeed: String?
    let lifespan: String?
    let weight: String?
    let height: String?
    let ageOfSexualMaturity: String?
    let ageOfWeaning: String?
}
