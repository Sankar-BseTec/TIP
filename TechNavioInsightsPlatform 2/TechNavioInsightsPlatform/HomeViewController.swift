//
//  HomeViewController.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 24/08/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tblVwFeed: UITableView!
    @IBOutlet weak var pgControl: UIPageControl!
    @IBOutlet weak var carouselVw: iCarousel!
    @IBOutlet weak var menuVw: UIView!
    @IBAction func advancedSearchTapped(_ sender: Any) {
        let fltr = WalkThroughVC(nibName: "WalkThroughVC", bundle: nil)
        //let fltr = FilterViewController(nibName: "FilterViewController", bundle: nil)
        self.navigationController?.pushViewController(fltr, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let bgcolor = UIColor(hex: "6EA943")
        self.view.backgroundColor = bgcolor
        
       // self.drawCrossLines()
       
        
        tblVwFeed.reloadData()
        Singleton.instance.setValue(name: "Shankar")
//        var x = 1
//        self.numWithoutLoop(val: &x)
       
        let nameV = self.revStr(str: "malayalam")
        if nameV == "malayalam" {
            print("pali")
        }else{
            print("no pal")
        }
        
        var arr = [5,4,8,3,2,7,9,1,6,8,3,3,2,5]
        print(self.removeDuplicateArr(dupArr: arr))
        arr = self.removeDuplicateArr(dupArr: arr)
        print(self.searchElePos(numToSearch: 9, arrSearch: arr))
        print(self.ascOrd(intArr: &arr))
        var fibVal : Int = 6
        print("fibo ",self.fibo(val: &fibVal))
        
        // Do any additional setup after loading the view.
    }
    
    func drawCrossLines() -> Void {
        var startxPoint : CGFloat = (menuVw.frame.width - 15 )/2
        var satrtyPoint : CGFloat = 80
        
        var endxPoint : CGFloat = (menuVw.frame.width - 15 )/2
        var endyPoint : CGFloat = menuVw.frame.height - 130
        
        self.drawLineFromPoint(start: CGPoint(x: startxPoint, y: satrtyPoint), toPoint: CGPoint(x: endxPoint, y: endyPoint), ofColor: UIColor.white, inView: menuVw)
        
        
        startxPoint = 20
        satrtyPoint = (menuVw.frame.height - 35 )/2
        
        endxPoint = menuVw.frame.width - 75
        endyPoint = (menuVw.frame.height - 35 )/2
        
        self.drawLineFromPoint(start: CGPoint(x: startxPoint, y: satrtyPoint), toPoint: CGPoint(x: endxPoint, y: endyPoint), ofColor: UIColor.white, inView: menuVw)
    }
    //AIzaSyDtATks93YIH2Ng4Lk1V9_gM9E0xIYCSS4 AIzaSyAN2hKqBIwpHoG-jN1HOOQeyyxEVbATaGQ
    func updatePageControl() {
        for (index, dot) in pgControl.subviews.enumerated() {
            if index == pgControl.currentPage {
                dot.backgroundColor = UIColor.red
                dot.layer.cornerRadius = dot.frame.size.height / 2;
            } else {
                let myColor = UIColor.brown
                dot.backgroundColor = UIColor.clear
                dot.layer.cornerRadius = dot.frame.size.height / 2
                dot.layer.borderColor = myColor.cgColor
                dot.layer.borderWidth = 1.0
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfItems(in carousel: iCarousel) -> Int
    {
        return 10
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView
    {
        var cellVw : UIView
        var itemView: UIImageView
        
        if (view == nil)
        {
            cellVw = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 170))
            itemView = UIImageView(frame:CGRect(x:20, y:0, width:280, height:170))
            
            itemView.contentMode = .scaleAspectFill
            itemView.image = UIImage(named: "Slider_Img_1")
            itemView.layer.cornerRadius = 10
            itemView.clipsToBounds = true
            
            cellVw.addSubview(itemView)
        }
        else
        {
            cellVw = view!
        }
        
       
        
        return cellVw
    }

    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        pgControl.currentPage = index
       
    }
    
    func carouselWillBeginScrollingAnimation(_ carousel: iCarousel) {
        pgControl.currentPage = carousel.currentItemIndex
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        switch (option)
        {
        case .spacing:
            return value * 1.8
        
        default:
            return value
        }
    }
    
    
//    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
//        pgControl.currentPage = carousel.currentItemIndex
//    }
    
   
    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        
        //create a path
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        //create a shape, and add the path to it
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 1.0
        
        //if we are at the end of the view, move the view left by 10, and add the 10 to the right, making it roll
        
        if(end.x > view.frame.width*0.95){
            
            let newRect = CGRect(x: view.frame.origin.x-10, y: view.frame.origin.y, width: view.frame.width+10, height: view.frame.height)
            view.frame = newRect
        }
        
        //wait till there iss data to show, so we don't get a huge spike from 0.0
        
        if(start != CGPoint.zero){
            view.layer.addSublayer(shapeLayer)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: FeedCell! = tblVwFeed.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell
        
            if cell == nil {
            tblVwFeed.register(UINib(nibName: "FeedCell", bundle: nil), forCellReuseIdentifier: "FeedCell")
            cell = tblVwFeed.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell
        }
        return cell
    }
    
    
    
    func numWithoutLoop(val : inout Int){
        
        if val <= 100 {
            print(val)
            val = val + 1
            self.numWithoutLoop(val: &val)
        }else{
            return
        }
    }
    
    func revStr(str : String) -> String {
        
        let count = Array(str.characters).count
        var charArr = Array(str.characters)
        var newArr : String = ""
        for i in stride(from: count-1, to: -1, by: -1) {
            newArr.append(charArr[i])
        }
        
        return newArr
    }
    
    
    func qkSort(arr : [Int]) -> [Int] {
        
        let piv = arr[arr.count-1]
        var curEle = arr[0]
        
        for i in 0..<arr.count{
            if piv > curEle {
                    curEle = 0
            }
            else{
            
            }
        }
        
        return arr
    }
    
    func swapNum(arr:[Int]) -> [Int] {
        
        return arr
    }
    
    
    func ascOrd(intArr :inout [Int]) -> [Int]{
        
        // [5,4,8,3,2,7,9,1,6] 0
       
        
        let n = intArr.count
        for i in 0..<n{
            for j in i+1..<n {
                if intArr[i] > intArr[j] {
                    swap(&intArr[i], &intArr[j])
                }
            }
        }
        
        return intArr
    }
    
    func searchElePos(numToSearch : Int , arrSearch : [Int]) -> Int {
        var pos : Int = 0
        for i in 0..<arrSearch.count {
            if numToSearch == arrSearch[i] {
                print(numToSearch,"at position ",i)
                pos = i
                break
            }
        }
        
        return pos
    }
    
    func removeDuplicateArr(dupArr : [Int]) -> [Int] {
        
        var newArr : [Int] = []
        
        for i in 0..<dupArr.count {
            if newArr.contains(dupArr[i]) {
                
            }else{
                newArr.append(dupArr[i])
            }
        }
        
        return newArr
    }
    
    
    func fibo(val : inout Int) -> Int{
        
        if val == 0 {
            return 0
        }
        if val == 1 {
            return 1
        }
        else{
            var temp1 = val - 1
            var temp2 = val - 2
            val = self.fibo(val: &temp1) + self.fibo(val:&temp2)
        }
        
        return val
    }
}


extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}




