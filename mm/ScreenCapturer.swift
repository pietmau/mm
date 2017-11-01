import Foundation
import UIKit

class ScreenCapturer {
    private var controller: ViewController

    init(_ controller: ViewController) {
        self.controller = controller
    }

    func capture() -> UIImage {
        controller.navigationController?.isToolbarHidden = true
        controller.navigationController?.isNavigationBarHidden = true

        UIGraphicsBeginImageContext(controller.view.frame.size)
        controller.view.drawHierarchy(in: controller.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        controller.navigationController?.isToolbarHidden = false
        controller.navigationController?.isNavigationBarHidden = false

        return memedImage
    }
}
