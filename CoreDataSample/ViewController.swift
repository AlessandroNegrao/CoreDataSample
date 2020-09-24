//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Alessandro Negrão on 24/09/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonAction: UIButton!
    
    @IBAction func buttonActionTrue(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Socorro", message: "O que aconteceu?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(key: "Whatever", comment: "default action"), style: .default, handler: {
            _ in
            NSLog(format: "The \"OK\" alert occured.")
        }))
        
        
        
        alert.addTextField()
        present(alert, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}


