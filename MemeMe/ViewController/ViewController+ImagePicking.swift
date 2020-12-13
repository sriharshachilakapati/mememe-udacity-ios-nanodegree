//
//  ViewController+ImagePicking.swift
//  MemeMe
//
//  Created by Sri Harsha Chilakapati on 13/12/20.
//

import UIKit

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    internal func startPicker(source: UIImagePickerController.SourceType) {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = source
        pickerController.delegate = self

        present(pickerController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }

        dismiss(animated: true, completion: nil)
    }
}
