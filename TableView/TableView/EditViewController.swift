//
//  EditViewController.swift
//  TableView
//
//  Created by Christopher Teddy on 10/11/20.
//  Copyright © 2020 Christopher Teddy. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lbl_edit_category: UITextField!
    @IBOutlet weak var lbl_edit_title: UITextField!
    
    var editTitle:String?
    var editCategory:String?
    var row:Int?
    var section:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl_edit_title.text = editTitle!
        lbl_edit_category.text = editCategory!

        // Do any additional setup after loading the view.
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
