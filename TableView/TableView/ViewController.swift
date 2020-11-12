//
//  ViewController.swift
//  TableView
//
//  Created by Christopher Teddy on 25/10/20.
//  Copyright © 2020 Christopher Teddy. All rights reserved.
//

import UIKit


struct product{
    var title:String?
    var Category:String?
    var description:String?
}

var arrSections = [String]()
var arrayNote = [[product]]()
  

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet weak var lbl_category: UILabel!
    
    @IBOutlet weak var tvNote: UITableView!
    
    var chooseCategory:String?
    
    func initData(){
        
        arrayNote.append([product]())
        arrayNote[0].append(product(title: "Gym", Category: "Private",description: "Pergi Gym biar sehat"))
        arrayNote[0].append(product(title: "Renang", Category: "Private",description: "Pergi Renang biar seger"))
        arrayNote[0].append(product(title: "Lari", Category: "Private",description: "Lari 5 KM"))
        arrSections.append(arrayNote[0][0].Category!)
        
        arrayNote.append([product]())
        arrayNote[1].append(product(title: "Nugas", Category: "Urgent", description: "Nugas boi biar kelar"))
        arrayNote[1].append(product(title: "Ngerjain UAS", Category: "Urgent", description: "Ngerjain uas biar dapet bagus"))
        arrayNote[1].append(product(title: "Coding", Category: "Urgent", description: "sering coding biar jago"))
        arrSections.append(arrayNote[1][0].Category!)
        
        arrayNote.append([product]())
        arrayNote[2].append(product(title: "Nge Game", Category: "Hobby", description: "nge game biar chill"))
        arrayNote[2].append(product(title: "Netflix", Category: "Hobby", description: "nonton netflix kuyy"))
        arrSections.append(arrayNote[2][0].Category!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tvNote.reloadData()
        
        let defaults = UserDefaults.standard
               
        chooseCategory = defaults.bool(forKey: "show_category") ? "On" : "Off"
        lbl_category.text = chooseCategory
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
            
        chooseCategory = defaults.bool(forKey: "show_category") ? "On" : "Off"
        lbl_category.text = chooseCategory
        
        initData()
        tvNote.dataSource = self
        tvNote.delegate = self
        
        
        let app = UIApplication.shared
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: app)
        
         NotificationCenter.default.addObserver(self, selector: #selector(reloadDataTable), name: UIApplication.willEnterForegroundNotification, object: app)

    }
    
    @objc func applicationWillEnterForeground(){
        let defaults = UserDefaults.standard
        
        chooseCategory = defaults.bool(forKey: "show_category") ? "On" : "Off"
        lbl_category.text = chooseCategory
    }
    
    @objc func reloadDataTable(){
        tvNote.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue_to_edit", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_to_edit" {
            let dest = segue.destination as! EditNoteViewController
            let row = (sender as! NSIndexPath).row
            let section = (sender as! NSIndexPath).section
            let title = arrayNote[section][row].title
            let category = arrayNote[section][row].Category
            let description = arrayNote[section][row].description
            
            dest.editTitle = title
            dest.editCategory = category
            dest.editDescription = description
            dest.row = row
            dest.section = section
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if arrayNote[indexPath.section].count > 1 {
              arrayNote[indexPath.section].remove(at: indexPath.row)
            


            } else {
          
           //     arrSections.remove(at: indexPath.section)
                arrayNote[indexPath.section].remove(at: indexPath.row)
               
            }

           
           
           
            tableView.reloadData()
        }
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
      
            return arrSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        //Change Category
        if lbl_category.text == "On" {
            //
            if arrayNote[section].count == 0 {
                
                return nil
            }
            
            
            return arrSections[section]
        } else {
            
            return nil
        }
       
    }
    
   
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        
          
         return arrayNote[section].count
     }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! ProductTableViewCell
         
        cell.productName.text = arrayNote[indexPath.section][indexPath.row].title
        
        cell.productDescription.text = arrayNote[indexPath.section][indexPath.row].description
         
         return cell
     }
}

