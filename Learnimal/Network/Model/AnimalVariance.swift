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

//[
//  {
//    "name": "Cheetah",
//    "taxonomy": {
//      "kingdom": "Animalia",
//      "phylum": "Chordata",
//      "class": "Mammalia",
//      "order": "Carnivora",
//      "family": "Felidae",
//      "genus": "Acinonyx",
//      "scientific_name": "Acinonyx jubatus"
//    },
//    "locations": [
//      "Africa",
//      "Asia",
//      "Eurasia"
//    ],
//    "characteristics": {
//      "prey": "Gazelle, Wildebeest, Hare",
//      "name_of_young": "Cub",
//      "group_behavior": "Solitary/Pairs",
//      "estimated_population_size": "8,500",
//      "biggest_threat": "Habitat loss",
//      "most_distinctive_feature": "Yellowish fur covered in small black spots",
//      "gestation_period": "90 days",
//      "habitat": "Open grassland",
//      "diet": "Carnivore",
//      "average_litter_size": "3",
//      "lifestyle": "Diurnal",
//      "common_name": "Cheetah",
//      "number_of_species": "5",
//      "location": "Asia and Africa",
//      "slogan": "The fastest land mammal in the world!",
//      "group": "Mammal",
//      "color": "BrownYellowBlackTan",
//      "skin_type": "Fur",
//      "top_speed": "70 mph",
//      "lifespan": "10 - 12 years",
//      "weight": "40kg - 65kg (88lbs - 140lbs)",
//      "height": "115cm - 136cm (45in - 53in)",
//      "age_of_sexual_maturity": "20 - 24 months",
//      "age_of_weaning": "3 months"
//    }
//  }
//]
