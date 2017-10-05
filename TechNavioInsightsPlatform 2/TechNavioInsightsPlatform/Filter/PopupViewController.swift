//
//  PopupViewController.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 26/09/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import UIKit


protocol SelectionDelegate {
    
    /// default implementation is empty.
    func selectedRow(selectedrow : Int)
}


class PopupViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var rowSelect : Int = 0
    var rowDefault : Int = 0
    var delegate : SelectionDelegate? = nil
     var tupleArrayData: [(code: Int32, dataText: String, selectionCode: Bool, selectionType: Int)] = []
    
    @IBOutlet weak var closeBtnBottomContstrain: NSLayoutConstraint!
    @IBOutlet weak var popupVw: UIView!
    @IBOutlet weak var tblVwVw: UITableView!
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBAction func closeBtnTapped(_ sender: Any) {
        
        self.delegate?.selectedRow(selectedrow: rowDefault)
        self.closeAction()
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        
        self.delegate?.selectedRow(selectedrow: rowSelect)
        self.closeAction()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<tupleArrayData.count{
            if tupleArrayData[i].selectionType == 1{
                rowDefault = tupleArrayData[i].selectionType
                return
            }
        }
        
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext

        popupVw.layer.cornerRadius = 3.5
        popupVw.layer.masksToBounds = true
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.closeBtnBottomContstrain.constant = 45

        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func closeAction() -> Void {
        self.closeBtnBottomContstrain.constant = -100
        
        UIView.animate(withDuration: 0.4, animations: {
            self.view.layoutIfNeeded()
        }, completion: {
            (completed : Bool) in
            self.dismiss(animated: true, completion: nil)
        })

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tupleArrayData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: PopupCell! = tblVwVw.dequeueReusableCell(withIdentifier: "PopupCell") as? PopupCell
        
        if cell == nil {
            tblVwVw.register(UINib(nibName: "PopupCell", bundle: nil), forCellReuseIdentifier: "PopupCell")
            cell = tblVwVw.dequeueReusableCell(withIdentifier: "PopupCell") as? PopupCell
            //PopupBlurredTransparent
        }
        cell.txtLbl.text = tupleArrayData[indexPath.row].dataText
        
        if tupleArrayData[indexPath.row].selectionType == 1 {
            cell?.tickHeightContraint.constant = 18
            cell?.tickWidthConstraint.constant = 18
        }else{
            cell?.tickHeightContraint.constant = 0
            cell?.tickWidthConstraint.constant = 0
        }

        cell.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tblVwVw.deselectRow(at: indexPath, animated: false)
        rowSelect = indexPath.row
        self.reloadRow(indexPathRow: indexPath.row)

    }
    
    func reloadRow(indexPathRow : Int) -> Void {
        
        
        weak var cell : PopupCell?
        var indexPath : IndexPath
        for i in 0..<tupleArrayData.count {
            
            indexPath = IndexPath(item: i, section: 0)
            cell = tblVwVw.cellForRow(at: indexPath) as? PopupCell
            
            if i == indexPathRow {
                
                cell?.tickHeightContraint.constant = 18
                cell?.tickWidthConstraint.constant = 18
            }else{
                
                cell?.tickHeightContraint.constant = 0
                cell?.tickWidthConstraint.constant = 0
            }
            UIView.animate(withDuration: 0.3, animations: {
                cell?.layoutIfNeeded()
            })
        }
        
    }
    
    
    
}
