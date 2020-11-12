//
//  AddViewController.swift
//  TableView
//
//  Created by Christopher Teddy on 09/11/20.
//  Copyright © 2020 Christopher Teddy. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var lbl_title: UITextField!
    @IBOutlet weak var lbl_category: UITextField!
    @IBOutlet weak var lbl_description: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_add(_ sender: Any) {
        
        if ( lbl_title.text?.isEmpty == true) {
            showAlert(title: "Tilte", message: "Tile must be filled")
        } else if ( lbl_category.text?.isEmpty == true) {
            showAlert(title: "Category", message: "Category must be filled")
        } else if (lbl_description.text?.isEmpty == true) {
            showAlert(title: "Description", message: "Description must be filled")
        } else {
            var posisi: Int?
                   var flag = 0
                   for i in 0...arrSections.count-1 {
                       let cariCategory = lbl_category.text!
                       if cariCategory == arrSections[i] {
                           posisi = i
                           flag = 1
                        arrayNote[posisi ?? 0].append(product(title: lbl_title.text, Category: lbl_category.text, description: lbl_description.text!))
                           break
                       }
                   }
                   
                   if flag == 0 {
                       arrayNote.append([product]())
                       arrSections.append(lbl_category.text!)
                    arrayNote[arrSections.count-1].append(product(title: lbl_title.text, Category: lbl_category.text, description: lbl_description.text))
                   }
            
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    func showAlert(title:String, message:String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           
           alert.addAction(okAction)
           present(alert, animated: true, completion: nil)
       }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
