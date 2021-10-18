//
//  HardCodedAnswerViewController.swift
//  8ball-magic
//
//  Created by Stanislav on 17.10.2021.
//

import UIKit

class HardCodedAnswerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let hardCodedAnswerModel = HardCodedAnswerModel()
    private let hardCodedAnswerView = HardCodedAnswerView()
    private let picker = UIPickerView()
    
    override func loadView() {
        view = hardCodedAnswerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        
        view.backgroundColor = .white
        hardCodedAnswerView.setHardCodedAnswer(UserDefaults.standard.string(forKey: "answer") ?? hardCodedAnswerModel.motivationAnswers[0])
        hardCodedAnswerView.setupInputView(picker)
    }
}

extension HardCodedAnswerViewController {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hardCodedAnswerModel.motivationAnswers.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hardCodedAnswerModel.motivationAnswers[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hardCodedAnswerModel.saveAnswer(hardCodedAnswerModel.motivationAnswers[row])
        hardCodedAnswerView.setHardCodedAnswer(hardCodedAnswerModel.motivationAnswers[row])
        self.view.endEditing(false)
    }
}

