import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            myImage.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}

