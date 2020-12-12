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

    override func viewWillAppear(_ animated: Bool) {
        subscribeToKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeFromKeyboardNotifications()
    }

    private func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        if !bottomTextField.isFirstResponder {
            return
        }

        view.frame.origin.y -= getKeyboardHeight(notification)
    }

    private func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        if !bottomTextField.isFirstResponder {
            return
        }

        view.frame.origin.y = 0
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
