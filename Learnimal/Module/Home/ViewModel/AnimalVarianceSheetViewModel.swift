//
//  AnimalVarianceSheetViewModel.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 22/01/24.
//

import Foundation

struct AnimalVarianceSheetViewModel {
    var imageStringUrl: String
    let varianceName: String
    let slogan: String
    let foundAt: String
    let willPrey: String
    
    init(variance: VarianceResult) {
        self.imageStringUrl = ""
        self.varianceName = variance.name
        self.slogan = variance.characteristics?.slogan ?? "No slogan found"
        self.foundAt = "Found in \(variance.locations?.joined(separator: ", ") ?? "the world")"
        self.willPrey = "Will prey \(variance.characteristics?.prey ?? "food")"
    }
    
    init() {
        self.imageStringUrl = ""
        self.varianceName = "template"
        self.slogan = "template"
        self.foundAt = "template"
        self.willPrey = "template"
    }
}
