//
//  NetworkService.swift
//  8ball-magic
//
//  Created by Stanislav on 17.10.2021.
//

import Foundation

class NetworkService {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let urlString = URL(string: urlString) else { return }
        let request = URLRequest(url: urlString)
        URLSession.shared.dataTask(with: request, completionHandler: { (data, _, error) in
            completion(data, error)
        }).resume()
    }
    
    func dataAnswerFetch(urlString: String, completion: @escaping (Answer?, Error?) -> Void) {
        request(urlString: urlString) { (data, error) in
            if let error = error {
                print("ERROR")
                completion(nil, error)
            }
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode(Magic.self, from: data)
            let responseAnswer = response?.magic
            completion(responseAnswer, nil)
        }
    }
}
