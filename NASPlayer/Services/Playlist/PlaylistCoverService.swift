//
//  PlaylistCoverRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 22/9/2023.
//

import SwiftUI
import Combine

class PlaylistCoverService: ObservableObject {
    var playlistRequest = PlaylistRequest()
    var coverRequest = CoverRequest()
    var cancellable: AnyCancellable?
    
    @Published var image: UIImage?
    
    @Published var isLoading = true
    @Published var error: NetworkError?
    
    init(id: String) {
        self.trigger(id: id)
    }
    
    func trigger(id: String) {
        self.cancellable = self.playlistRequest
            .detailPublisher(id: id)
            .flatMap({ response in
                let id = (response.data?.playlists?.first?.additional?.songs?.first?.id)!
                return self.coverRequest.songPublisher(id: id)
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
