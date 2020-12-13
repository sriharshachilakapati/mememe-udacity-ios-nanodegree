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
    @IBOutlet weak var cameraButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextField(topTextField)
        setupTextField(bottomTextField)

        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)

        setDefaultState()
    }

    override func viewWillAppear(_ animated: Bool) {
        subscribeToKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeFromKeyboardNotifications()
    }

    private func setDefaultState() {
        imageView.image = nil
        topTextField.text = nil
        bottomTextField.text = nil
    }

    @IBAction func onCameraClicked() {
        startPicker(source: .camera)
    }

    @IBAction func onAlbumClicked() {
        startPicker(source: .photoLibrary)
    }

    @IBAction func onShareClicked() {
        // TODO
    }

    @IBAction func onCancelClicked() {
        setDefaultState()
        view.endEditing(true)
    }
}
