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

    private let textFieldDelegate = SelfClosingTextFieldDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextField(topTextField)
        setupTextField(bottomTextField)

        setDefaultState()
    }

    private func setupTextField(_ textField: UITextField) {
        textField.delegate = textFieldDelegate

        setTextAttributes(withExisting: &textField.defaultTextAttributes, color: UIColor.gray)

        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!,
                                                             attributes: textField.defaultTextAttributes)

        setTextAttributes(withExisting: &textField.defaultTextAttributes, color: UIColor.white)
    }

    private func setTextAttributes(withExisting existingAttributes: inout [NSAttributedString.Key : Any], color: UIColor) {
        let newAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -1,
            NSAttributedString.Key.foregroundColor: color
        ]

        existingAttributes = newAttributes.merging(existingAttributes) { (new, _) in new }
    }

    private func setDefaultState() {
        imageView.image = nil
        topTextField.text = nil
        bottomTextField.text = nil
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
        view.endEditing(true)
    }
}
