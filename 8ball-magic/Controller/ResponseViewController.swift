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
        setupNavigationBar()
    }
    
    func view() -> ResponseView {
        return self.view as! ResponseView
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.backItem?.title = ""
        navigationController?.toolbar.setShadowImage(UIImage(), forToolbarPosition: .any)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:  UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(didTapSetting))
    }

    @objc func didTapSetting() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "HardCodedAnswerViewController") as? HardCodedAnswerViewController else { return }
        show(vc, sender: nil)
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            self.responseModel.getAnswer(completion: { answer in
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.view().setAnswer(answer ?? "")
                }
            })
        }
    }
}
