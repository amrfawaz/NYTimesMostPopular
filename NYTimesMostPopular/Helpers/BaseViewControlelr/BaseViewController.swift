//
//  BaseViewController.swift
//  NYTimesMostPopular
//
//  Created by AmrFawaz on 5/21/20.
//  Copyright © 2020 AmrFawaz. All rights reserved.
//

import Lottie
import UIKit

typealias CustomAlertClosure = ((UIAlertAction) -> Void)

class BaseViewController: UIViewController {
    var loadAnimationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showErrorAnimation() {
        showLottieAnimation(fileName: "error")
    }

    func showLoadingAnimation() {
        showLottieAnimation(fileName: "loading")
    }

    func showEmptyAnimation() {
        showLottieAnimation(fileName: "empty")
    }

    private func showLottieAnimation(fileName: String) {
        loadAnimationView = AnimationView(name: fileName)
        loadAnimationView?.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        loadAnimationView?.center = view.center
        loadAnimationView?.contentMode = .scaleAspectFill
        view.addSubview(loadAnimationView!)
        loadAnimationView?.play(completion: { _ in
        })
    }

    func hideLottieAnimation() {
        loadAnimationView?.stop()
        loadAnimationView?.removeFromSuperview()
    }

    func showCustomAlert(title: String, message: String, doneButtonTitle: String, doneAction: (CustomAlertClosure)? = nil, cancelButtonTitle: String = "", cancelActin: (CustomAlertClosure)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: doneButtonTitle, style: .default, handler: doneAction))
        if !cancelButtonTitle.isEmpty {
            alert.addAction(UIAlertAction(title: cancelButtonTitle, style: .default, handler: cancelActin))
        }
        present(alert, animated: true, completion: nil)
    }

    func addCloseButton(color: UIColor) {
        let closeButton = UIBarButtonItem()
        closeButton.style = .done
        closeButton.target = self
        closeButton.action = #selector(dismissView)
        closeButton.tintColor = color
        closeButton.image = #imageLiteral(resourceName: "Close")
        navigationItem.leftBarButtonItem = closeButton
    }

    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
