//
//  Animal.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 19/01/24.
//

import Foundation

struct Animal: Identifiable, Codable {
    let id: String
    let name: String
    let filename: String?
}
