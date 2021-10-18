//
//  HardCodedAnswerViewController.swift
//  8ball-magic
//
//  Created by Stanislav on 17.10.2021.
//

import UIKit

class HardCodedAnswerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let hardCodedAnswersModel = HardCodedAnswersModel()
    private let hardCodedAnswerView = HardCodedAnswerView()
    private let picker = UIPickerView()
    
    override func loadView() {
        view = hardCodedAnswerView
    }
    
    func view() -> HardCodedAnswerView {
        return self.view as! HardCodedAnswerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self

        view().backgroundColor = .white
        view().setHardCodedAnswer(UserDefaults.standard.string(forKey: "answer") ?? hardCodedAnswersModel.motivationAnswers[0])
        view().setupInputView(picker)
    }
}

extension HardCodedAnswerViewController {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hardCodedAnswersModel.motivationAnswers.count
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hardCodedAnswersModel.motivationAnswers[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hardCodedAnswersModel.saveAnswer(hardCodedAnswersModel.motivationAnswers[row])
        view().setHardCodedAnswer(hardCodedAnswersModel.motivationAnswers[row])
        self.view.endEditing(false)
    }
}

