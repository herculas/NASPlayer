//
//  ComposerListService.swift
//  NASPlayer
//
//  Created by 宋睿 on 1/10/2023.
//

import Foundation
import Combine

class ComposerListService: ObservableObject {
    private var cancellable: AnyCancellable?
    var composerRequest = ComposerRequest()
    
    @Published var composerList: [ComposerVM]?
    @Published var isLoading = true
    @Published var error: NetworkError?
    
    init(limit: Int? = nil) {
        self.trigger(limit: limit)
    }
    
    func trigger(limit: Int?) {
        self.cancellable = self.composerRequest
            .composerListPublisher(limit: limit)
            .subscribe(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        self.isLoading = false
                    case .failure(let error):
                        self.error = error
                }
            }, receiveValue: { response in
                if let composers = response.data?.composers {
                    self.composerList = composers.map(transform)
                }
            })
    }
}
