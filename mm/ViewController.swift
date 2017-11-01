import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var camUiBarButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var uiImageView: UIImageView!
    
    @IBOutlet weak var upperLabel: UILabel!
    
    @IBOutlet weak var lowerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        camUiBarButtonItem.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        upperLabel.text = "TOP"
        lowerLabel.text = "BOTTOM"
        upperLabel.textAlignment = .center
        lowerLabel.textAlignment = .center
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

