
import UIKit

class TableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func onAddClicked(_ sender: Any) {
        let controller: ViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.separatorStyle = .none
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getMemes().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ListElement", for: indexPath)
        
        let meme = getMemes()[indexPath.row]
        if let top = cell.textLabel {
            top.text = meme.topText
        }
        if let bottom = cell.detailTextLabel {
            bottom.text = meme.bottomText
        }
        if let imageView = cell.imageView {
            imageView.image = meme.memedImage
        }
        return cell
    }

    private func getMemes()->[Meme]{
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
}
