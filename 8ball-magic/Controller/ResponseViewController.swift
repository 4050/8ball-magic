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
    
    private let answerLabel: UILabel = {
        let label = UILabel()
        let maxSize = CGSize(width: 150, height: 300)
        let size = label.sizeThatFits(maxSize)
        label.text = Text.shakeMe
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: size)
        return label
    }()
    
    private let magicLabel: UILabel = {
        let label = UILabel()
        label.text = Text.iAmAMagicBall
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let askLabel: UILabel = {
        let label = UILabel()
        label.text = Text.askMeAnything
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func loadView() {
        view = responseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //        view.addSubview(magicLabel)
        //        view.addSubview(askLabel)
        //        view.addSubview(answerLabel)
        //  setupLayout()
    }
    
    
    private func setupLayout() {
        magicLabel.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        magicLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        magicLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        askLabel.topAnchor.constraint(equalTo: magicLabel.bottomAnchor, constant: 10).isActive = true
        askLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        askLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        answerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        answerLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        answerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        answerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
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
