
import Foundation
import UIKit

struct Meme {
    public let memedImage: UIImage
    public let topText: String
    public let bottomText: String
    public let originalImage: UIImage
    
    init(topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage) {
        self.memedImage = memedImage
        self.bottomText = bottomText
        self.topText = topText
        self.originalImage = originalImage
    }
}
