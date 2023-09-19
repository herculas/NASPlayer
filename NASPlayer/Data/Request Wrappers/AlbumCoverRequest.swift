//
//  AlbumCoverRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

class AlbumCoverRequest: ObservableObject {
    
    var request = Request()
    
    @Published var isLoading = true
    @Published var error: Error?
    @Published var image: UIImage?
    
    init(album: AlbumVM) {
        self.load(album: album)
    }
    
    func load(album: AlbumVM) {
        let url = """
        https://server.herculas.net:12803/webapi/AudioStation/cover.cgi?\
        api=SYNO.AudioStation.Cover&\
        method=getcover&\
        version=3&\
        library=all&\
        album_name=\(album.name)&\
        album_artist_name=\(album.albumArtist)&\
        _sid=n8it2WrZ5RDJ_DudfMTLYnaxzI3jgdeircqeKKXMJ5Eo8N1r3bRnr4TDycZl3A5Lczmj9newol8iFM3DxKeigU
        """
        
        request.get(from: url) { image, error, isLoading in
            if let image: UIImage = image {
                self.image = image
                self.isLoading = isLoading
                self.error = error
            }
        }
    }
}
