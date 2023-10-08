//
//  ArtistListService.swift
//  NASPlayer
//
//  Created by 宋睿 on 30/9/2023.
//

import Foundation
import Combine

class ArtistListService: ObservableObject {
    private var cancellable: AnyCancellable?
    var artistRequest = ArtistRequest()
    
    @Published var artistList: [ArtistVM]?
    @Published var isLoading = true
    @Published var error: NetworkError?
    
    init(limit: Int? = nil) {
        self.load(limit: limit)
    }
    
    func load(limit: Int?) {
        self.cancellable = self.artistRequest
            .artistListPublisher(limit: limit)
            .subscribe(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        self.isLoading = false
                    case .failure(let error):
                        self.error = error
                }
            }, receiveValue: { response in
                if let artists = response.data?.artists {
                    self.artistList = artists.map(transform)
                }
            })
    }
}
