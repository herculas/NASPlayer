//
//  PlaylistDetailRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 20/9/2023.
//

import Foundation

class PlaylistDetailRequest: ObservableObject {
    
    var request = RequestWrapper()
    
    @Published var isLoading = true
    @Published var error: Error?
    @Published var songs: [SongVM]?
    @Published var count: Int?
    @Published var duration: Int?
    
    init(id: String, limit: Int?) {
        self.load(id: id, limit: limit)
    }
    
    func load(id: String, limit: Int?) {
        let url = """
        https://server.herculas.net:12803/webapi/AudioStation/playlist.cgi?\
        _sid=n8it2WrZ5RDJ_DudfMTLYnaxzI3jgdeircqeKKXMJ5Eo8N1r3bRnr4TDycZl3A5Lczmj9newol8iFM3DxKeigU&\
        api=SYNO.AudioStation.Playlist&\
        library=all&\
        method=getinfo&\
        version=3&\
        additional=sharing_info,songs,songs_song_tag,songs_song_audio,songs_song_rating&\
        id=\(id)&\
        songs_limit=\(limit ?? 5000)&\
        songs_offset=0
        """
        
        request.get(from: url) { data, error, isLoading in
            if let data = data,
               let playlists: Response<Playlists> = resolve(json: data),
               let songs = playlists.data?.playlists?.first?.additional?.songs {
                self.isLoading = isLoading
                self.error = error
                self.songs = songs.map(transform)
                self.count = songs.count
                self.duration = songs.reduce(0) { $0 + ($1.additional?.songAudio?.duration ?? 0) }
            }
        }
    }
}
