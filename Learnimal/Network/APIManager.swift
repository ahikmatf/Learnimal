//
//  APIManager.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 20/01/24.
//

import Foundation
import Combine

class APIManager {
    @Published var variancesSheetViewModel = [AnimalVarianceSheetViewModel]()
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
