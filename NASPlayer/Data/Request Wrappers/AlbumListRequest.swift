//
//  AlbumListRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import Foundation

class AlbumListRequest: ObservableObject {
    
    var request = Request()
    
    @Published var isLoading = true
    @Published var error: Error?
    @Published var albumList: [AlbumVM]?
    
    init() {
        self.load()
    }
    
    func load() {
        let url = """
        https://server.herculas.net:12803/webapi/AudioStation/album.cgi?\
        _sid=n8it2WrZ5RDJ_DudfMTLYnaxzI3jgdeircqeKKXMJ5Eo8N1r3bRnr4TDycZl3A5Lczmj9newol8iFM3DxKeigU&\
        api=SYNO.AudioStation.Album&\
        library=all&\
        method=list&\
        version=3
        """
        
        request.get(from: url) { data, error, isLoading in
            if let data = data,
               let albums: Response<Albums> = resolve(json: data),
               let albums = albums.data?.albums {
                self.albumList = albums.map(transform)
                self.isLoading = isLoading
                self.error = error
            }
        }
    }
}
