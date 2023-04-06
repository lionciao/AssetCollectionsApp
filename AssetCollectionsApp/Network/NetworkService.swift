//
//  NetworkService.swift
//  AssetCollectionsApp
//
//  Created by Ciao on 2023/4/6.
//

public protocol NetworkService {
    
    typealias CompletionHandler<R: NetworkRequest> = (Swift.Result<R.Entity, Error>) -> Void
    
    @discardableResult
    func send<R: NetworkRequest>(
        _ request: R,
        completion: @escaping CompletionHandler<R>
    ) -> NetworkCancellable?
}
