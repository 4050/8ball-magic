//
//  HardCodedAnswerViewController.swift
//  8ball-magic
//
//  Created by Stanislav on 17.10.2021.
//

import UIKit

class HardCodedAnswerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let hardCodedAnswersModel = HardCodedAnswersModel()
    private let picker = UIPickerView()
    
    private let answerLabel: UILabel = {
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
    
    private let textField: UITextField = {
        let tf = UITextField()
        tf.textColor = .black
        tf.textAlignment = .center
        tf.tintColor = UIColor.clear
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.font = UIFont.boldSystemFont(ofSize: 12)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        picker.delegate = self
        picker.dataSource = self
        
        textField.inputView = picker
        
        textField.text = hardCodedAnswersModel.motivationAnswers[0]
        view.addSubview(textField)
        view.addSubview(answerLabel)
        setupLayout()
    }
    
    func setupLayout() {
        answerLabel.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        answerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        answerLabel.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: 0).isActive = true

        textField.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 10).isActive = true
        textField.leftAnchor.constraint(equalTo:  view.leftAnchor, constant: 10).isActive = true
        textField.rightAnchor.constraint(equalTo:  view.rightAnchor, constant: -10).isActive = true
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hardCodedAnswersModel.motivationAnswers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hardCodedAnswersModel.motivationAnswers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(hardCodedAnswersModel.motivationAnswers[row], forKey: "answer")
        textField.text = hardCodedAnswersModel.motivationAnswers[row]
        self.view.endEditing(false)
    }
}
