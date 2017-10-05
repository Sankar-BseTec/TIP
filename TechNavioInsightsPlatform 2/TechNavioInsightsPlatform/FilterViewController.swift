//
//  FilterViewController.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 21/09/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SelectionDelegate {

    @IBOutlet weak var filterTblVw: UITableView!
    @IBAction func applyBtnTapped(_ sender: Any) {
       
        var tupleArrayData: [(code: Int32, dataText: String, selectionCode: Bool, selectionType: Int)] = []
        
        tupleArrayData.append((code: 11231,dataText :"Everywhere",selectionCode:true,selectionType:1))
        tupleArrayData.append((code: 11232,dataText :"Title",selectionCode:false,selectionType:0))
        tupleArrayData.append((code: 11233,dataText :"Body",selectionCode:false,selectionType:0))
        
        
        let popupVC = PopupViewController(nibName: "PopupViewController", bundle: nil)
        popupVC.delegate = self
        popupVC.modalTransitionStyle = .crossDissolve
        popupVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        popupVC.tupleArrayData = tupleArrayData
        self.present(popupVC, animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgcolor = UIColor(hex: "6EA943")
        self.view.backgroundColor = bgcolor
        filterTblVw.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func selectedRow(selectedrow : Int){
        print(selectedrow)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 255
        }
        else{
            return 510
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0{
            var cell: FilterTopCell! = filterTblVw.dequeueReusableCell(withIdentifier: "FilterTopCell") as? FilterTopCell
            
            if cell == nil {
                filterTblVw.register(UINib(nibName: "FilterTopCell", bundle: nil), forCellReuseIdentifier: "FilterTopCell")
                cell = filterTblVw.dequeueReusableCell(withIdentifier: "FilterTopCell") as? FilterTopCell
                
            }
            return cell
        }else{
            var cell: FilterBottomCell! = filterTblVw.dequeueReusableCell(withIdentifier: "FilterBottomCell") as? FilterBottomCell
            
            if cell == nil {
                filterTblVw.register(UINib(nibName: "FilterBottomCell", bundle: nil), forCellReuseIdentifier: "FilterBottomCell")
                cell = filterTblVw.dequeueReusableCell(withIdentifier: "FilterBottomCell") as? FilterBottomCell
            }
            return cell
        }
    
    }

}
