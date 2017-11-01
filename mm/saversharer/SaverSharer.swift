import Foundation
import UIKit

class SaverSharer {
    let controller: ViewController

    init(_ controller: ViewController) {
        self.controller = controller
    }

    func share(_ meme: Meme) {
        let map: [Any] = [meme.memedImage]
        let activtyViewController = UIActivityViewController(activityItems: map, applicationActivities: nil)
        controller.present(activtyViewController, animated: true, completion: nil)
    }
}
