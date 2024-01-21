//
//  HomeAnimalViewModel.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 19/01/24.
//

import Foundation

class HomeAnimalViewModel: ObservableObject {
    @Published var variancesSheetViewModel = [AnimalVarianceSheetViewModel]()
    @Published var animalListViewModel = [AnimalImageViewModel]()
    private let apiManager: APIManager = APIManager()
    private let animalList = ["Elephant", "Lion", "Fox", "Dog", "Shark", "Turtle", "Whale", "Penguin"]
    
    init() {
        prepareAnimalData()
    }
    
    func prepareAnimalData() {
        let animalListViewModel: [AnimalImageViewModel] = [
            .init(name: "Elephant"),
            .init(name: "Lion"),
            .init(name: "Fox"),
            .init(name: "Dog"),
            .init(name: "Shark"),
            .init(name: "Turtle"),
            .init(name: "Whale"),
            .init(name: "Penguin")
        ]
        
        for (_, element) in animalListViewModel.enumerated() {
            fetchAnimalImage(name: element.name) { viewModel in
                guard let viewModel = viewModel else { return }
                self.animalListViewModel.append(viewModel)
            }
        }
    }
    
    func fetchAnimalVariance(name: String, completion: @escaping (Bool) -> Void) {
        apiManager.fetchAnimalVariance(name: name) { isSuccess in
            self.variancesSheetViewModel = self.apiManager.variancesSheetViewModel
            completion(isSuccess)
        }
    }
    
    private func fetchAnimalImage(name: String, completion: @escaping (AnimalImageViewModel?) -> Void) {
        apiManager.fetchAnimalImage(query: name, completion: completion)
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
