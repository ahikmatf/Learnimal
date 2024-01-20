//
//  HomeAnimalViewModel.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 19/01/24.
//

import Foundation

class HomeAnimalViewModel: ObservableObject {
    @Published var animals = [Animal]()
    @Published var variancesSheetViewModel = [AnimalVarianceSheetViewModel]()
    private let apiManager: APIManager = APIManager()
    
    init() {
        fetchAnimals()
    }
    
    func fetchAnimals() {
        self.animals = [
            .init(id: IdGenerator.generate(index: 0, name: "Elephant"), name: "Elephant", filename: "animal-elephant"),
            .init(id: IdGenerator.generate(index: 1, name: "Lion"), name: "Lion", filename: "animal-lion"),
            .init(id: IdGenerator.generate(index: 2, name: "Fox"), name: "Fox", filename: "animal-fox"),
            .init(id: IdGenerator.generate(index: 3, name: "Dog"), name: "Dog", filename: "animal-fox"),
            .init(id: IdGenerator.generate(index: 4, name: "Shark"), name: "Shark", filename: "animal-fox"),
            .init(id: IdGenerator.generate(index: 5, name: "Turtle"), name: "Turtle", filename: "animal-fox"),
            .init(id: IdGenerator.generate(index: 6, name: "Whale"), name: "Whale", filename: "animal-fox"),
            .init(id: IdGenerator.generate(index: 7, name: "Penguin"), name: "Penguin", filename: "animal-fox")
        ]
    }
    
    func fetchAnimalVariance(name: String, completion: @escaping (Bool) -> Void) {
        apiManager.fetchAnimalVariance(name: name) { isSuccess in
            self.variancesSheetViewModel = self.apiManager.variancesSheetViewModel
            completion(isSuccess)
        }
    }
}

struct AnimalVarianceSheetViewModel {
    let varianceName: String
    let slogan: String
    let foundAt: String
    let willPrey: String
    
    init(variance: VarianceResult) {
        self.varianceName = variance.name
        self.slogan = variance.characteristics?.slogan ?? "No slogan found"
        self.foundAt = "Found in \(variance.locations?.joined(separator: ", ") ?? "the world")"
        self.willPrey = "Will prey \(variance.characteristics?.prey ?? "food")"
    }
    
    init() {
        self.varianceName = "template"
        self.slogan = "template"
        self.foundAt = "template"
        self.willPrey = "template"
    }
}
