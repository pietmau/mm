import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    @IBOutlet  var camUiBarButtonItem: UIBarButtonItem!

    @IBOutlet  var uiImageView: UIImageView!

    @IBOutlet  var topText: UITextField!
       
    @IBOutlet  var bottomText: UITextField!

    let topDelegate = CustomTextDelegate()

    let bottomDelegate = CustomTextDelegate()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        camUiBarButtonItem.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        topText.text = "TOP"
        bottomText.text = "BOTTOM"
        topText.delegate = topDelegate
        bottomText.delegate = bottomDelegate

        let textAttributes: [String: Any] = [
            NSAttributedStringKey.strokeColor.rawValue: UIColor.black,
            NSAttributedStringKey.foregroundColor.rawValue: UIColor.black,
            NSAttributedStringKey.font.rawValue: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedStringKey.strokeWidth.rawValue: -1, ]
        bottomText.defaultTextAttributes = textAttributes
        topText.defaultTextAttributes = textAttributes
        topText.textAlignment = .center
        bottomText.textAlignment = .center
    }

    @IBAction func onShareClicked(_ sender: Any) {
        let memedImage = ScreenCapturer(self).capture()
        let meme = Meme(topText: topText.text!, bottomText: bottomText.text!, originalImage: uiImageView.image!, memedImage: memedImage)
        SaverSharer(self).share(meme)
    }
    
    @IBAction func OnPickClicked(_ sender: UIBarButtonItem) {
        showPicker(source: .photoLibrary)
    }

    @IBAction func onCancelClicked(_ sender: Any) {
            dismiss(animated: true, completion: {})
    }
    
    @IBAction func onCamClicked(_ sender: UIBarButtonItem) {
        showPicker(source: .camera)
    }

    private func showPicker(source: UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = source
        present(imagePicker, animated: true, completion: nil)
    }

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        onImagePicked(info: info)
        dismiss(animated: true, completion: nil)
    }

    private func onImagePicked(info: [String: Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            uiImageView.image = image
            shareButton.isEnabled = true
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }

    @objc func keyboardWillShow(_ sender: Notification) {
        view.frame = view.frame.offsetBy(dx: 0, dy: -getY(notification: sender))
    }

    @objc func keyboardWillHide(_ sender: Notification) {
        view.frame = view.frame.offsetBy(dx: 0, dy: +getY(notification: sender))
    }

    func getY(notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }

}

