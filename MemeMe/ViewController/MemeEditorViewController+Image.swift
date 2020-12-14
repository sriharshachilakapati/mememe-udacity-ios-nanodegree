//
//  ViewController+ImagePicking.swift
//  MemeMe
//
//  Created by Sri Harsha Chilakapati on 13/12/20.
//

import UIKit

extension MemeEditorViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    internal func startPicker(source: UIImagePickerController.SourceType) {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = source
        pickerController.delegate = self
        pickerController.allowsEditing = true

        present(pickerController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            shareButton.isEnabled = true
            imageView.image = image
        }

        dismiss(animated: true, completion: nil)
    }

    internal func showShareActivity() {
        let memedImage = generateMemedImage()
        let activityController = UIActivityViewController(activityItems: [ memedImage ], applicationActivities: nil)

        activityController.completionWithItemsHandler = { (_, completed, _, _) in
            if completed {
                self.save(originalImage: self.imageView.image!, memedImage: memedImage)
                self.dismiss(animated: true, completion: nil)
            }
        }

        present(activityController, animated: true, completion: nil)
    }

    private func save(originalImage: UIImage, memedImage: UIImage) {
        _ = Meme(topText: self.topTextField.text!, bottomText: self.bottomTextField.text!, originalImage: originalImage, memedImage: memedImage)

        // TODO: Use this in version 2.0 of the app
    }

    private func generateMemedImage() -> UIImage {
        setUIVisibility(isVisible: false)

        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)

        let memedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        setUIVisibility(isVisible: true)

        return memedImage
    }

    private func setUIVisibility(isVisible: Bool) {
        navigationController?.setNavigationBarHidden(!isVisible, animated: true)
        toolbar.isHidden = !isVisible

        setEmptyTextFieldVisibility(topTextField, isVisible)
        setEmptyTextFieldVisibility(bottomTextField, isVisible)
    }

    private func setEmptyTextFieldVisibility(_ textField: UITextField, _ isVisible: Bool) {
        if !textField.hasText {
            textField.isHidden = !isVisible
        }
    }
}
