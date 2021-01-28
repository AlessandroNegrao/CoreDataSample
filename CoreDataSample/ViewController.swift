//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Alessandro Negrão on 24/09/20.
//

import UIKit
import CoreData
import CloudKit

var database: [NSManagedObject] = []

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewSafada: UITableView!
    @IBOutlet weak var buttonAction: UIButton!

    @IBAction func buttonActionTrue(_ sender: UIButton) {
        
        let generator = UINotificationFeedbackGenerator()
        //Avisa ao dispositivo para iniciar a parte mecanica
        generator.prepare()
        generator.notificationOccurred(.success)
        
        let alert = UIAlertController(title: "Alerta de Brinquedo!", message: "Hi Lorena", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: NSLocalizedString("Save", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"save\" alert occured.")
            let textField = alert.textFields?.first
            save(nome:  (textField?.text)!)
            self.tableViewSafada.reloadData()
        }))
        

        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manage = appDelegate.persistentContainer.viewContext
        
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Brinquedo")
        
        do {
            database = try manage.fetch(fetch)
            for brinquedo    in database{
                print("Registro: ", brinquedo.value(forKey: "nome") as! String)
            }
          } catch {
            print("erro")
          }
    }
}

func save(nome: String){
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let manage = appDelegate.persistentContainer.viewContext
    
    let entityBrinquedo = NSEntityDescription.entity(forEntityName: "Brinquedo", in: manage)!
    let brinquedo = NSManagedObject(entity: entityBrinquedo, insertInto: manage)
    brinquedo.setValue(nome, forKey: "nome")
do{
        try manage.save()
        print("Deu bom")
        database.append(brinquedo)
        } catch {
           print(error)
        }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = database[indexPath.row].value(forKey: "nome") as? String
        print("DATABASE: ", database[indexPath.row].value(forKey: "nome") as! String)

        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database.count
    }
    
}


