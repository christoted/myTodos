//
//  EditNoteViewController.swift
//  TableView
//
//  Created by Christopher Teddy on 10/11/20.
//  Copyright © 2020 Christopher Teddy. All rights reserved.
//

import UIKit

class EditNoteViewController: UIViewController {
    
    
    @IBOutlet weak var lbl_edit_title: UITextField!
    @IBOutlet weak var lbl_edit_category: UITextField!
    @IBOutlet weak var lbl_edit_description: UITextField!
    var editTitle:String?
    var editCategory:String?
    var editDescription:String?
    var row:Int?
    var section:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbl_edit_title.text = editTitle
        lbl_edit_category.text = editCategory
        lbl_edit_description.text = editDescription
    }
    
    @IBAction func btn_edit_save(_ sender: Any) {
        if ( lbl_edit_title.text?.isEmpty == true) {
            showAlert(title: "Title", message: "Title must be filled")
        } else if ( lbl_edit_category.text?.isEmpty == true) {
            showAlert(title: "Category", message: "Category must be filled")
        } else if ( lbl_edit_description.text?.isEmpty == true){
            showAlert(title: "Description", message: "Description must be filled")
        }else {
              var posisi: Int?
              var flag = 0
              for i in 0...arrSections.count-1 {
                    let cariCategory = lbl_edit_category.text!
                    if cariCategory == arrSections[i] {
                        posisi = i
                        flag = 1
                        
                         if arrayNote[section!].count > 1 {
                            arrayNote[section!].remove(at: row!)
                            arrayNote[posisi ?? 0].append(product(title: lbl_edit_title.text, Category: lbl_edit_category.text, description: lbl_edit_description.text!))
                         } else {
                            arrayNote[section!].remove(at: row!)
                      //      arrSections.remove(at: section!)
                            
                            //Bingung
                            arrayNote[posisi ?? 0].append(product(title: lbl_edit_title.text, Category: lbl_edit_category.text, description: lbl_edit_description.text!))
                         }
                                
                        break
                    }
              }
            
            if flag == 0 {
                if arrayNote[section!].count > 1 {
                    arrayNote[section!].remove(at: row!)
                    arrayNote.append([product]())
                    arrSections.append(lbl_edit_category.text!)
                    arrayNote[arrSections.count-1].append(product(title: lbl_edit_title.text, Category: lbl_edit_category.text, description: lbl_edit_description.text!))
                } else {
               //     arrayNote[section!].remove(at: row!)
               //    arrSections.remove(at: section!)
                    
                    arrSections[section!] = lbl_edit_category.text!
                    arrayNote[section!][row!].title = lbl_edit_title.text ?? "Test"
                    arrayNote[section!][row!].Category = lbl_edit_category.text ?? "test"
                    arrayNote[section!][row!].description = lbl_edit_description.text!
                    
                }
            }
            
            
            
            
//             arrSections[section!] = lbl_edit_category.text!
//             arrayNote[section!][row!].title = lbl_edit_title.text ?? "Test"
//             arrayNote[section!][row!].Category = lbl_edit_category.text ?? "test"
//
//             arrayNote[section!][row!].description = lbl_edit_description.text!
             
             navigationController?.popViewController(animated: true)
             dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

}
