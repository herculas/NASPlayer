//
//  SongCoverService.swift
//  NASPlayer
//
//  Created by 宋睿 on 26/9/2023.
//

import SwiftUI
import Combine

class SongCoverService: ObservableObject {
    var coverRequest = CoverRequest()
    var cancellable: AnyCancellable?
    
    @Published var image: UIImage?
    
    @Published var isLoading = true
    @Published var error: NetworkError?
    
    init(id: String) {
        self.trigger(id: id)
    }
    
    func trigger(id: String) {
        self.cancellable = self.coverRequest
            .songPublisher(id: id)
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
