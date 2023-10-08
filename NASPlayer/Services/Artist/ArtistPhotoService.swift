//
//  ArtistPhotoService.swift
//  NASPlayer
//
//  Created by 宋睿 on 30/9/2023.
//

import SwiftUI
import Combine

class ArtistPhotoService: ObservableObject {
    private var cancellable: AnyCancellable?
    var albumRequest = AlbumRequest()
    var coverRequest = CoverRequest()
    
    @Published var image: UIImage?
    @Published var isLoading = true
    @Published var error: NetworkError?
    
    init(name: String) {
        self.load(name: name)
    }
    
    func load(name: String) {
        self.cancellable = self.albumRequest
            .albumSearchPublisher(artist: name)
            .flatMap({ response in
                let title = (response.data?.albums?.first?.name)!
                let artist = (response.data?.albums?.first?.albumArtist)!
                return self.coverRequest.albumPublisher(title: title, artist: artist)
            })
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
