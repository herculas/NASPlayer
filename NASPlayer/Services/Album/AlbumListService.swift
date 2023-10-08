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
    
    @Published var albumList: [AlbumVM]?
    @Published var isLoading = true
    @Published var error: NetworkError?
    
    init(limit: Int? = nil) {
        self.load(limit: limit)
    }
    
    func load(limit: Int?) {
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
