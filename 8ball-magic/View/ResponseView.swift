//
//  ResponseView.swift
//  8ball-magic
//
//  Created by Stanislav on 17.10.2021.
//

import UIKit

class ResponseView: UIView {
    
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    func createSubviews() {
        addSubview(magicLabel)
        addSubview(askLabel)
        addSubview(answerLabel)
        setupLayout()
    }
    
    func getAnswer(_ answer: String) {
        answerLabel.text = answer
    }
    
    private func setupLayout() {
           magicLabel.topAnchor.constraint(
               equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
           magicLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
           magicLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true

           askLabel.topAnchor.constraint(equalTo: magicLabel.bottomAnchor, constant: 10).isActive = true
           askLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
           askLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true

           answerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
           answerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
           answerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
           answerLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
       }
}
