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
            fetchAnimalImage(name: element.name) { viewModels in
                guard let viewModel = viewModels.first else { return }
                self.animalListViewModel.append(viewModel)
            }
        }
    }
    
    func fetchAnimalVariance(name: String, completion: @escaping (Bool) -> Void) {
        self.variancesSheetViewModel.removeAll()
        apiManager.fetchAnimalVariance(name: name) { isSuccess in
            for (_, element) in self.apiManager.variancesSheetViewModel.enumerated() {
                self.fetchAnimalImage(name: element.varianceName) { imageModels in
                    guard let imageModel = imageModels.first else { return }
                    var updatedElement = element
                    updatedElement.imageStringUrl = imageModel.imageStringUrl
                    self.variancesSheetViewModel.append(updatedElement)
                }
            }
            completion(isSuccess)
        }
    }
    
    private func fetchAnimalImage(name: String, completion: @escaping ([AnimalImageViewModel]) -> Void) {
        apiManager.fetchAnimalImage(query: name, completion: completion)
    }
}
