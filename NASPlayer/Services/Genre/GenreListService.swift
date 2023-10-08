//
//  GenreListService.swift
//  NASPlayer
//
//  Created by 宋睿 on 30/9/2023.
//

import Foundation
import Combine

class GenreListService: ObservableObject {
    private var cancellable: AnyCancellable?
    var genreRequest = GenreRequest()
    
    @Published var genreList: [GenreVM]?
    @Published var isLoading = true
    @Published var error: NetworkError?
    
    init(limit: Int? = nil) {
        self.load(limit: limit)
    }
    
    func load(limit: Int?) {
        self.cancellable = self.genreRequest
            .genreListPublisher(limit: limit)
            .subscribe(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        self.isLoading = false
                    case .failure(let error):
                        self.error = error
                }
            }, receiveValue: { response in
                if let genres = response.data?.genres {
                    self.genreList = genres.map(transform)
                }
            })
    }
}
