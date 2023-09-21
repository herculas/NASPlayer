//
//  PlaylistsService.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import Foundation
import Combine

class PlaylistsService: ObservableObject {
    var playlistRequest = PlaylistRequest()
    var cancellable: AnyCancellable?
    
    @Published var playlists: [PlaylistVM]?
    
    @Published var isLoading = true
    @Published var error: NetworkError?
    
    init() {
        self.trigger()
    }
    
    func trigger() {
        self.cancellable = self.playlistRequest
            .listPublisher()
            .subscribe(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    self.error = error
                }
            }, receiveValue: { response in
                if let playlists = response.data?.playlists {
                    self.playlists = playlists.map(transform).filter{ $0.name != "__SYNO_AUDIO_SHARED_SONGS__" }
                }
            })
    }
}
