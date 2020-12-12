//
//  ViewController.swift
//  MemeMe
//
//  Created by Sri Harsha Chilakapati on 12/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setTextAttributes(for: topTextField)
        setTextAttributes(for: bottomTextField)

        setDefaultState()
    }

    private func setTextAttributes(for textField: UITextField) {
        let textAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1.0
        ]

        let existingAttributes = textField.defaultTextAttributes
        textField.defaultTextAttributes = textAttributes.merging(existingAttributes) { (current, _) in current }
    }

    private func setDefaultState() {
        imageView.image = nil
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
    }

    @IBAction func onCameraClicked() {
        // TODO
    }

    @IBAction func onAlbumClicked() {
        // TODO
    }

    @IBAction func onShareClicked() {
        // TODO
    }

    @IBAction func onCancelClicked() {
        setDefaultState()
    }
}
