//
//  ViewController+TextField.swift
//  MemeMe
//
//  Created by Sri Harsha Chilakapati on 13/12/20.
//

import UIKit

extension MemeEditorViewController : UITextFieldDelegate {
    internal func setupTextField(_ textField: UITextField) {
        textField.delegate = self

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

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if reason == .committed {
            shareButton.isEnabled = true
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
