import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
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
        let textAttributes:[String:Any] = [
            NSAttributedStringKey.strokeColor.rawValue: UIColor.black,
            NSAttributedStringKey.foregroundColor.rawValue: UIColor.black,
            NSAttributedStringKey.font.rawValue: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedStringKey.strokeWidth.rawValue: -1,]
        bottomText.defaultTextAttributes = textAttributes
        topText.defaultTextAttributes = textAttributes
        topText.textAlignment = .center
        bottomText.textAlignment = .center
    }
    
    @IBAction func OnPickClicked(_ sender: UIBarButtonItem) {
        showPicker(source: .photoLibrary)
    }
    
    @IBAction func onCamClicked(_ sender: UIBarButtonItem) {
        showPicker(source: .camera)
    }
    
    private func showPicker(source:UIImagePickerControllerSourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = source
        present(imagePicker, animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            uiImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
}

