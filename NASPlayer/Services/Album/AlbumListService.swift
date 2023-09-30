//
//  AlbumListService.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import Foundation
import Combine

class AlbumListService: ObservableObject {
    private var cancellable: AnyCancellable?
    var albumRequest = AlbumRequest()
    var limit: Int?
    
    @Published var albumList: [AlbumVM]?
    @Published var isLoading = true
    @Published var error: NetworkError?
    
    init(limit: Int? = nil) {
        self.limit = limit
        self.trigger()
    }
    
    func trigger() {
        self.cancellable = self.albumRequest
            .albumListPublisher(limit: limit)
            .subscribe(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        self.isLoading = false
                    case .failure(let error):
                        self.error = error
                }
            }, receiveValue: { response in
                if let albums = response.data?.albums {
                    self.albumList = albums.map(transform)
                }
            })
    }
}
