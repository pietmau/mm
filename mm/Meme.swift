
import Foundation
import UIKit

struct Meme {
    public let memedImage:UIImage

    init(topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage) {
        self.memedImage = memedImage
    }
}
