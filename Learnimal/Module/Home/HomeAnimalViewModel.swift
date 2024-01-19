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
            .init(id: NSUUID().uuidString, name: "Elephant", filename: "animal-elephant"),
            .init(id: NSUUID().uuidString, name: "Lion", filename: "animal-lion"),
            .init(id: NSUUID().uuidString, name: "Fox", filename: "animal-fox"),
            .init(id: NSUUID().uuidString, name: "Dog", filename: "animal-fox"),
            .init(id: NSUUID().uuidString, name: "Shark", filename: "animal-fox"),
            .init(id: NSUUID().uuidString, name: "Turtle", filename: "animal-fox"),
            .init(id: NSUUID().uuidString, name: "Whale", filename: "animal-fox"),
            .init(id: NSUUID().uuidString, name: "Penguin", filename: "animal-fox")
        ]
    }
}

