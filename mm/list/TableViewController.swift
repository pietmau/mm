
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
        if let image = cell.viewWithTag(1) as? UIImageView{
            image.image = meme.memedImage
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    private func getMemes()->[Meme]{
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
}
