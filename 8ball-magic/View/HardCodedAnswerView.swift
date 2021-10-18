//
//  HardCodedAnswerView.swift
//  8ball-magic
//
//  Created by Stanislav on 18.10.2021.
//

import UIKit

class HardCodedAnswerView: UIView {
    
    private var textLabel: UILabel = {
        let label = UILabel()
        let maxSize = CGSize(width: 150, height: 300)
        let size = label.sizeThatFits(maxSize)
        label.text = Text.chooseAnswer
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: size)
        return label
    }()
    
    private var textField: UITextField = {
        let tf = UITextField()
        tf.textColor = .black
        tf.textAlignment = .center
        tf.tintColor = UIColor.clear
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.font = UIFont.boldSystemFont(ofSize: 12)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
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
        addSubview(textField)
        addSubview(textLabel)
        setupLayout()
    }
    
    func setHardCodedAnswer(_ answer: String) {
        textField.text = answer
    }
    
    func setupInputView(_ picker: UIPickerView) {
        textField.inputView = picker
    }
    
    func setupLayout() {
        textLabel.topAnchor.constraint(equalTo:  safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        textLabel.rightAnchor.constraint(equalTo:  rightAnchor, constant: 0).isActive = true
        
        textField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10).isActive = true
        textField.leftAnchor.constraint(equalTo:  leftAnchor, constant: 10).isActive = true
        textField.rightAnchor.constraint(equalTo:  rightAnchor, constant: -10).isActive = true
    }
    
}
