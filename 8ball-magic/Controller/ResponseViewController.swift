//
//  ViewController.swift
//  8ball-magic
//
//  Created by Stanislav on 17.10.2021.
//

import UIKit

class ResponseViewController: UIViewController {
    
    private var responseModel = ResponseModel()
    private var responseView = ResponseView()

    override func loadView() {
        view = responseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            self.responseModel.getAnswer(completion: { answer in
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    //self.answerLabel.text = answer?.answer
                    self.responseView.getAnswer(answer?.answer ?? "")
                }
            })
        }
    }
}
