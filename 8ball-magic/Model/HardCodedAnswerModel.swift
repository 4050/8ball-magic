//
//  HadrCodedAnswerModel.swift
//  8ball-magic
//
//  Created by Stanislav on 17.10.2021.
//

import Foundation

struct HardCodedAnswersModel {
    var motivationAnswers = ["JUST DO IT!!!", "YES!!!", "CHANGE YOUR MIND!!!", "KEEP MOVING!!!"]
    
    func saveAnswer(_ saveAnswer: String) {
        UserDefaults.standard.set(saveAnswer, forKey: "answer")
    }
}
