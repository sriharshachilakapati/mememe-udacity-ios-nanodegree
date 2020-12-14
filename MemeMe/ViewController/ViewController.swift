//
//  ViewController.swift
//  MemeMe
//
//  Created by Sri Harsha Chilakapati on 12/12/20.
//

import UIKit

class ViewController: UIViewController, UIFontPickerViewControllerDelegate {

    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var shareButton: UIBarButtonItem!

    private var defaultFont: UIFont!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextField(topTextField)
        setupTextField(bottomTextField)

        defaultFont = topTextField.font!
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

        topTextField.font = defaultFont
        bottomTextField.font = defaultFont

        shareButton.isEnabled = false
    }

    @IBAction func onCameraClicked() {
        startPicker(source: .camera)
    }

    @IBAction func onAlbumClicked() {
        startPicker(source: .photoLibrary)
    }

    @IBAction func onShareClicked() {
        showShareActivity()
    }

    @IBAction func onCancelClicked() {
        setDefaultState()
        view.endEditing(true)
    }

    @IBAction func onFontClicked() {
        let fontPickerController = UIFontPickerViewController()
        fontPickerController.delegate = self
        present(fontPickerController, animated: true, completion: nil)
    }

    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        guard let descriptor = viewController.selectedFontDescriptor else { return }
        let font = UIFont(descriptor: descriptor, size: defaultFont.pointSize)

        topTextField.font = font
        bottomTextField.font = font
    }
}
