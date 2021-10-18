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
    
    private let networkService = NetworkService()
    
    func getAnswer(completion: @escaping (String?) -> Void) {
        networkService.dataAnswerFetch(urlString: Config.baseURL) { (response, error) in
            let responseAnswer: String?
            if error != nil {
                responseAnswer = UserDefaults.standard.string(forKey: "answer")
            } else {
                responseAnswer = response?.answer
            }
            completion(responseAnswer)
        }
    }
}

