//
//  NewsViewController.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 28/08/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var stackVw: UIStackView!
    @IBOutlet weak var vwServiceCat: UIView!
    @IBOutlet weak var vwRelaRepo: UIView!
    @IBOutlet weak var vwCusRepo: UIView!
    @IBOutlet weak var vwSubsRepo: UIView!
    @IBOutlet weak var carouselVw: UIScrollView!
    @IBOutlet weak var pgControlCarSousel: UIPageControl!
    
    var vwSubsRepoOrigin : CGFloat = 0
    var vwCusRepoOrigin : CGFloat = 0
    
    
    var subsCenter : CGPoint!
    var cusCenter : CGPoint!
    var relaCenter : CGPoint!
    var servCenter : CGPoint!
    
    var imageArray = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pgControlCarSousel.numberOfPages = 5
        pgControlCarSousel.currentPage = 0
        pgControlCarSousel.tintColor = UIColor.clear
        pgControlCarSousel.pageIndicatorTintColor = UIColor.white
        pgControlCarSousel.currentPageIndicatorTintColor = UIColor(hex: "6EA943")
        
        imageArray = [#imageLiteral(resourceName: "Banner-bg-2"),#imageLiteral(resourceName: "Banner-bg-3"),#imageLiteral(resourceName: "Banner-bg-2"),#imageLiteral(resourceName: "Banner-bg-3"),#imageLiteral(resourceName: "Banner-bg-2")]
        var xVal : CGFloat = -40
        for i in 0..<imageArray.count{
            
            let imgVw = UIImageView()
            imgVw.image = imageArray[i]
            imgVw.contentMode = .scaleAspectFit
            let xpos = self.view.frame.width * CGFloat(i) + 40
            xVal = xVal + 80
            imgVw.frame = CGRect(x: xpos, y: 0, width: self.carouselVw.frame.width-80, height: self.carouselVw.frame.height-30)
            carouselVw.contentSize.width = self.carouselVw.frame.width * CGFloat(i+1)
            carouselVw.addSubview(imgVw)
            
        }
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
//        vwSubsRepoOrigin = self.view.center.x
//        vwSubsRepo.center.x = self.view.frame.origin.y - vwSubsRepo.frame.size.width
//        
//        vwCusRepoOrigin = self.view.center.x
//        vwCusRepo.center.x = self.view.frame.origin.x + self.view.frame.size.width
        
        // pick original pos
        subsCenter = vwSubsRepo.center
        cusCenter = vwCusRepo.center
        relaCenter = vwRelaRepo.center
        servCenter = vwServiceCat.center
        
        
        vwCusRepo.center = subsCenter
        vwRelaRepo.center = subsCenter
        vwServiceCat.center = subsCenter
        
        
        vwCusRepo.alpha = 0
        vwRelaRepo.alpha = 0
        vwServiceCat.alpha = 0
        
        
        }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        vwCusRepo.center = subsCenter
        vwRelaRepo.center = subsCenter
        vwServiceCat.center = subsCenter

        vwCusRepo.alpha = 0
        vwRelaRepo.alpha = 0
        vwServiceCat.alpha = 0
        
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.vwCusRepo.center = self.cusCenter
            self.vwCusRepo.alpha = 1
            self.vwRelaRepo.center = self.relaCenter
            self.vwRelaRepo.alpha = 1
            self.vwServiceCat.center = self.servCenter
            self.vwServiceCat.alpha = 1
            
            
        }, completion: {(true) in
            
        })
        
        
      /*  UIView.animate(withDuration: 0.3, animations: {
           
            self.vwCusRepo.center = self.cusCenter
             self.vwCusRepo.alpha = 1
            self.vwRelaRepo.center = self.relaCenter
            self.vwRelaRepo.alpha = 1
            self.vwServiceCat.center = self.servCenter
            self.vwServiceCat.alpha = 1

            
        }, completion: {(true) in
            
            UIView.animate(withDuration: 0.3, animations: {
                self.vwRelaRepo.center = self.relaCenter
                self.vwRelaRepo.alpha = 1

            }, completion: {(true) in
                
                UIView.animate(withDuration: 0.3, animations: {
                    
                    self.vwServiceCat.center = self.servCenter
                    self.vwServiceCat.alpha = 1

                }, completion: {(true) in
                    
                })

            })

        })*/
        
        
        /*UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: ({
            
            print(self.vwSubsRepoOrigin)
            self.vwSubsRepo.center.x = self.vwSubsRepoOrigin
            
            
        }), completion: {(true) in
            
            self.animateCustVw()
        })*/

    }
    
    func animateCustVw() {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: ({
            
            print(self.vwCusRepoOrigin)
            self.vwCusRepo.center.x = self.vwCusRepoOrigin
            
            
        }), completion: {(true) in
            
            
        })

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        vwCusRepo.alpha = 0
        vwRelaRepo.alpha = 0
        vwServiceCat.alpha = 0
        
        vwCusRepo.center = subsCenter
        vwRelaRepo.center = subsCenter
        vwServiceCat.center = subsCenter
        
        
//        vwSubsRepo.center.x = self.view.frame.origin.y - vwSubsRepo.frame.size.width
//        vwCusRepo.center.x = self.view.frame.origin.x + self.view.frame.size.width
    }
    
    func timerAction() {
        
        var yOffSet:CGFloat = self.carouselVw.contentOffset.x
        
        if yOffSet > self.carouselVw.contentSize.width{
            yOffSet = 0
            yOffSet -= self.carouselVw.frame.width
        }else{
            yOffSet += self.carouselVw.frame.width
        }
        DispatchQueue.main.async() {
            UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.carouselVw.contentOffset.x = yOffSet
            }, completion: nil)
        }
    }

    
    func moveToNextPage (){
        
        let pageWidth:CGFloat = self.carouselVw.frame.width
        let maxWidth:CGFloat = pageWidth * 4
        let contentOffset:CGFloat = self.carouselVw.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        self.carouselVw.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.carouselVw.frame.height), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let fractionalPage = Int((scrollView.contentOffset.x+(0.5*scrollView.frame.size.width))/scrollView.frame.width)+1
        
        
        print(fractionalPage)
        
        
        pgControlCarSousel.currentPage = Int(fractionalPage)
        
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
