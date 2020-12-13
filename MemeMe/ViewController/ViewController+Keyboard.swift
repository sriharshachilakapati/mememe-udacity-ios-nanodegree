//
//  ViewController+Keyboard.swift
//  MemeMe
//
//  Created by Sri Harsha Chilakapati on 13/12/20.
//

import UIKit

extension ViewController {
    internal func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    internal func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        if !bottomTextField.isFirstResponder {
            return
        }

        view.frame.origin.y -= getKeyboardHeight(notification)
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        if !bottomTextField.isFirstResponder {
            return
        }

        view.frame.origin.y = 0
    }

    private func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
}
