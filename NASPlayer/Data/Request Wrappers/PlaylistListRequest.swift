//
//  PlaylistListRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 20/9/2023.
//

import Foundation

class PlaylistListRequest: ObservableObject {
    
    var request = Request()
    
    @Published var isLoading = true
    @Published var error: Error?
    @Published var playlists: [PlaylistVM]?
    
    init() {
        self.load()
    }
    
    func load() {
        let url = """
        https://server.herculas.net:12803/webapi/AudioStation/playlist.cgi?\
        _sid=n8it2WrZ5RDJ_DudfMTLYnaxzI3jgdeircqeKKXMJ5Eo8N1r3bRnr4TDycZl3A5Lczmj9newol8iFM3DxKeigU&\
        api=SYNO.AudioStation.Playlist&\
        library=all&\
        method=list&\
        version=3&\
        limit=100&\
        offset=0
        """
        
        request.get(from: url) { data, error, isLoading in
            if let data = data,
               let playlists: Response<Playlists> = resolve(json: data),
               let playlists = playlists.data?.playlists {
                self.playlists = playlists.map(transform).filter{ $0.name != "__SYNO_AUDIO_SHARED_SONGS__" }
                self.isLoading = isLoading
                self.error = error
            }
        }
    }
}
