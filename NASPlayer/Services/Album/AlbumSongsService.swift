//
//  AlbumSongsService.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import Foundation
import Combine

class AlbumSongsService: ObservableObject {
    private var cancellable: AnyCancellable?
    var songRequest = SongRequest()
    
    @Published var songs: [SongVM]?
    @Published var count: Int?
    @Published var duration: Int?
    @Published var isLoading = true
    @Published var error: NetworkError?
    
    init(album: String) {
        self.trigger(album: album)
    }
    
    func trigger(album: String) {
        self.cancellable = self.songRequest
            .songsPublisher(album: album)
            .subscribe(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    self.error = error
                }
            }, receiveValue: { response in
                if let songs = response.data?.songs {
                    self.songs = songs.map(transform)
                    self.count = songs.count
                    self.duration = songs.reduce(0) { $0 + ($1.additional?.songAudio?.duration ?? 0) }
                }
            })
    }
}
