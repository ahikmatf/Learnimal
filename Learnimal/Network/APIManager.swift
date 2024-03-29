//
//  APIManager.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 20/01/24.
//

import Foundation
import Combine

protocol APIManagerProtocol {
    var variancesSheetViewModel: [AnimalVarianceSheetViewModel] { get }
    var animalImagesViewModel: [AnimalImageViewModel] { get }
    
    func fetchAnimalVariance(name: String, completion: @escaping (Bool) -> Void)
    func fetchAnimalImage(query: String, count: Int, completion: @escaping ([AnimalImageViewModel]) -> Void)
}

class APIManager: APIManagerProtocol {
    @Published var variancesSheetViewModel = [AnimalVarianceSheetViewModel]()
    @Published var animalImagesViewModel = [AnimalImageViewModel]()
    private var subscriber = Set<AnyCancellable>()
    
    func fetchAnimalVariance(name: String, completion: @escaping (Bool) -> Void) {
        let animalsUrlString = "https://api.api-ninjas.com/v1/animals?name=\(name)"
        guard let animalsUrl = URL(string: animalsUrlString) else { return }
        var urlRequest = URLRequest(url: animalsUrl)
        urlRequest.setValue("pfFQJxLiPMYqvY5rZXbYdw==VBjYVanTRFZdEhx9", forHTTPHeaderField: "X-Api-Key")
        
        fetch(url: urlRequest) { (result: Result<[VarianceResult], Error>) in
            switch result {
            case .success(let result):
                self.variancesSheetViewModel = result.map { AnimalVarianceSheetViewModel(variance: $0) }
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
    
    func fetchAnimalImage(query: String, count: Int = 1, completion: @escaping ([AnimalImageViewModel]) -> Void) {
        let animalsUrlString = "https://api.pexels.com/v1/search?query=\(query)&per_page=\(count)&orientation=square&size=small"
        guard let animalsUrl = URL(string: animalsUrlString) else { return }
        var urlRequest = URLRequest(url: animalsUrl)
        urlRequest.setValue("F0RsC7L6viQO7bzFmZTKs7hwGWhXlwm5TjAozyXUwkTmB8INisxbwjVg", forHTTPHeaderField: "Authorization")
        
        fetch(url: urlRequest) { (result: Result<ImageResult, Error>) in
            switch result {
            case .success(let result):
                var viewModels = [AnimalImageViewModel]()
                for photo in result.photos {
                    viewModels.append(.init(name: query, photo: photo))
                }
                completion(viewModels)
            case .failure(let error):
                print(error.localizedDescription)
                completion([])
            }
        }
    }
    
    private func fetch<T: Decodable>(url: URLRequest, completion: @escaping (Result<T, Error>) -> Void )  {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink { (resultCompletion) in
                switch resultCompletion {
                case .failure(let error):
                    completion(.failure(error))
                case .finished:
                    return
                }
            } receiveValue: { (resultArr) in
                completion(.success(resultArr))
            }
            .store(in: &subscriber)
    }
}
