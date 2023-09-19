//
//  AlbumDetailRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import Foundation

class AlbumDetailRequst: ObservableObject {
    
    var request = Request()
    
    @Published var isLoading = true
    @Published var error: Error?
    @Published var songs: [Int: [SongVM]]?
    @Published var count: Int?
    @Published var duration: Int?
    
    init(album: String) {
        self.load(album: album)
    }
    
    func load(album: String) {
        let url = """
        https://server.herculas.net:12803/webapi/AudioStation/song.cgi?\
        _sid=n8it2WrZ5RDJ_DudfMTLYnaxzI3jgdeircqeKKXMJ5Eo8N1r3bRnr4TDycZl3A5Lczmj9newol8iFM3DxKeigU&\
        api=SYNO.AudioStation.Song&\
        method=list&\
        version=3&\
        album=\(album)&\
        library=all&\
        additional=song_tag,song_audio,song_rating,sharing_info,song_share,song_sharing,getsharing&\
        offset=0&\
        limit=5000
        """
        
        request.get(from: url) { data, error, isLoading in
            if let data = data,
               let songs: Response<Songs> = resolve(json: data),
               let songs = songs.data?.songs {
                self.isLoading = isLoading
                self.error = error
                
                self.songs = Dictionary(grouping: songs.map(transform), by: { $0.disc })
                self.count = songs.count
                self.duration = songs.reduce(0) { $0 + ($1.additional?.songAudio?.duration ?? 0) }
            }
        }
    }
}
