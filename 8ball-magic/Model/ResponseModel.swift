//
//  Model.swift
//  8ball-magic
//
//  Created by Stanislav on 17.10.2021.
//

import Foundation

struct Magic: Codable {
    var magic: Answer
}

struct Answer: Codable {
    var answer: String?
}

class ResponseModel {
    
    private let networkService: NetworkService
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getAnswer(completion: @escaping (Answer?) -> Void) {
        networkService.dataAnswerFetch(urlString: Config.baseURL) { (response, error) in
            let responseAnswer = response
            completion(responseAnswer)
        }
    }
}
