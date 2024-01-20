//
//  HomeAnimalViewModel.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 19/01/24.
//

import Foundation

class HomeAnimalViewModel: ObservableObject {
    @Published var animals = [Animal]()
    
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
}

