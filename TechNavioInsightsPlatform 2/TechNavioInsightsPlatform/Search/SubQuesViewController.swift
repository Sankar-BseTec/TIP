//
//  SubQuesViewController.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 12/09/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import UIKit


protocol BtnDelegate {
    func changeText()
    
    
}


class SubQuesViewController: UIViewController {

    var delegate : BtnDelegate?
    
    @IBAction func dongTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnTapped(_ sender: Any) {
        delegate?.changeText()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
