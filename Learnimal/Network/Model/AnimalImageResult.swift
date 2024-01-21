//
//  AnimalImageResults.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 20/01/24.
//

import Foundation

struct ImageResult: Codable {
    let totalResults: Int
    let page: Int
    let perPage: Int
    let photos: [Photo]
}

struct Photo: Codable {
    let id: Int
    let width: Int?
    let height: Int?
    let url: String?
    let photographer: String?
    let photographerUrl: String?
    let photographerId: Int?
    let avgColor: String?
    let src: Source?
    let liked: Bool?
    let alt: String?
}

struct Source: Codable {
    let original: String?
    let large2x: String?
    let large: String?
    let medium: String?
    let small: String?
    let portrait: String?
    let landscape: String?
    let tiny: String?
}
