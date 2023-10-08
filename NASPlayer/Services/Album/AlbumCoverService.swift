//
//  AlbumCoverService.swift
//  NASPlayer
//
//  Created by 宋睿 on 22/9/2023.
//

import SwiftUI
import Combine

class AlbumCoverService: ObservableObject {
    private var cancellable: AnyCancellable?
    var coverRequest = CoverRequest()
    
    @Published var image: UIImage?
    @Published var isLoading = true
    @Published var error: NetworkError?
    
    init(album: AlbumVM) {
        self.load(title: album.name, artist: album.albumArtist)
    }
    
    func load(title: String, artist: String) {
        self.cancellable = self.coverRequest
            .albumPublisher(title: title, artist: artist)
            .subscribe(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    self.error = error
                }
            }, receiveValue: { image in
                self.image = image
            })
    }
}
