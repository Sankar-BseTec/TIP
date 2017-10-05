//
//  AccountViewController.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 28/08/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController,iCarouselDelegate,iCarouselDataSource {

    var helperObj = HelperClass()
    
    let headerSearch : NSDictionary = [
        "category" : "",
        "country" : "India",
        "keyword" : "website",
        "limit" : "20",
        "offset": "0"
    ]
    @IBOutlet weak var pgControl: UIPageControl!
    @IBOutlet weak var carouselVw: iCarousel!
    @IBOutlet weak var menuVw: UIView!
    @IBOutlet weak var s1View: UIStackView!
    @IBOutlet weak var s2View: UIStackView!
    @IBOutlet weak var numLblSubRepo: UILabel!
    @IBOutlet weak var numLblIndFeeds: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let bgcolor = UIColor(hex: "6EA943")
        self.view.backgroundColor = bgcolor
        
        pgControl.numberOfPages = 10
        pgControl.currentPage = 0
        pgControl.tintColor = UIColor.clear
        pgControl.pageIndicatorTintColor = UIColor.white
        pgControl.currentPageIndicatorTintColor = UIColor.darkGray
        
        self.drawCrossLines()
        numLblSubRepo.textColor = UIColor(hex : "345a19")
        numLblIndFeeds.textColor = UIColor(hex : "345a19")
        
        carouselVw.type = iCarouselType.coverFlow
        carouselVw .reloadData()
        
        
        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        self.searchAPICall()
        
        /*
         
         file_maps.put("Hannibal", "http://static2.hypable.com/wp-content/uploads/2013/12/hannibal-season-2-release-date.jpg");
         file_maps.put("Big Bang Theory", "http://tvfiles.alphacoders.com/100/hdclearart-10.png");
         file_maps.put("House of Cards", "http://cdn3.nflximg.net/images/3093/2043093.jpg");
         file_maps.put("Game of Thrones", "http://images.boomsbeat.com/data/images/full/19640/game-of-thrones-season-4-jpg.jpg");
         
         */
    }
    
    func searchAPICall() {
        
        helperObj.httpRequestWithMethodName("POST",.searchCard, headers: headerSearch,urlParam:"", success: { (result) in
            let log : GeneralModel = (result as? GeneralModel)!
            
            if log.statusCode == "1" && log.errorStatus == "0"
            {
                print(log.searchArray)
                // is to bring back to main thread
                
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                   // self.loadingView?.stopLoading()
                }
                DispatchQueue.main.async {
                    print("Search back on the main thread: \(Thread.isMainThread)")
                   // self.searchCardTable.reloadData()
                    
                }
            }
            else{
                print(log.errorMsg)
            }
            
        }, failure: { (result) in
            let error : WarningMessageHandler = (result as? WarningMessageHandler)!
            print(error)
        })
    }
    
    func drawCrossLines() -> Void {
        var startxPoint : CGFloat = s1View.frame.origin.x + s1View.frame.width/2
        var satrtyPoint : CGFloat = 0
        
        var endxPoint : CGFloat = s1View.frame.origin.x + s1View.frame.width/2
        var endyPoint : CGFloat = s1View.frame.origin.y + s1View.frame.height
        
        self.drawLineFromPoint(start: CGPoint(x: startxPoint, y: satrtyPoint), toPoint: CGPoint(x: endxPoint, y: endyPoint), ofColor: UIColor.white, inView: menuVw)
        
        
        startxPoint = s1View.frame.origin.x + s1View.frame.width/2
        satrtyPoint = s1View.frame.origin.y + s1View.frame.height
        
        endxPoint = s2View.frame.origin.x + s2View.frame.width/2
        endyPoint = s2View.frame.origin.y + s2View.frame.height
        
        self.drawLineFromPoint(start: CGPoint(x: startxPoint, y: satrtyPoint), toPoint: CGPoint(x: endxPoint, y: endyPoint), ofColor: UIColor.white, inView: menuVw)
        
        
       /* 
         
        startxPoint = 10
        satrtyPoint = s1View.frame.origin.y + s1View.frame.height
        
        endxPoint = s1View.frame.origin.x + s1View.frame.width - 20
        endyPoint = s1View.frame.origin.y + s1View.frame.height
        */
        
        
         
         startxPoint = 10
         satrtyPoint = s2View.frame.origin.y
         
         endxPoint = s2View.frame.origin.x + s2View.frame.width - 20
         endyPoint = s2View.frame.origin.y
         
        
        
        self.drawLineFromPoint(start: CGPoint(x: startxPoint, y: satrtyPoint), toPoint: CGPoint(x: endxPoint, y: endyPoint), ofColor: UIColor.white, inView: menuVw)
        
        
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

    
}
