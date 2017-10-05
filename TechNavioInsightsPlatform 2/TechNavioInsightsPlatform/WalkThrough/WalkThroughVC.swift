//
//  WalkThroughVC.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 03/10/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import UIKit

class WalkThroughVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var pgControlWalkThru: UIPageControl!
    var dataArr : [WalkThroughModel]{
        
        var dataAr = [WalkThroughModel]()
        dataAr.append(WalkThroughModel(imgName: "Banner-bg-3", titleTxt: """
    Inside the secret room you'll find a red ball on the ground.
    """, descTxt: """
   Examine the portrait of a white snake near where the secret room is and you'll be prompted to insert the red ball. Once you do the painting on the right will fall.
 """))
        dataAr.append(WalkThroughModel(imgName: "Banner-bg-2", titleTxt: "Inside the secret room you'll find a red ball on the ground.", descTxt: "Examine the portrait of a white snake near where the secret room is and you'll be prompted to insert the red ball. Once you do the painting on the right will fall."))
        dataAr.append(WalkThroughModel(imgName: "Banner-bg-1", titleTxt: "Inside the secret room you'll find a red ball on the ground.", descTxt: "Examine the portrait of a white snake near where the secret room is and you'll be prompted to insert the red ball. Once you do the painting on the right will fall."))
        dataAr.append(WalkThroughModel(imgName: "Banner-bg-3", titleTxt: "Inside the secret room you'll find a red ball on the ground.", descTxt: "Examine the portrait of a white snake near where the secret room is and you'll be prompted to insert the red ball. Once you do the painting on the right will fall."))
        return dataAr
    }
    
    
    func configCollectionView(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth, height: screenHeight)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        collectionVwWalkThru.collectionViewLayout = layout
        collectionVwWalkThru.isPagingEnabled = true
        let nib = UINib(nibName: "WalkThruCell", bundle: nil)
        collectionVwWalkThru.register(nib, forCellWithReuseIdentifier: "WalkThruCell")
        
//        DispatchQueue.main.async{
//            self.collectionVwWalkThru.reloadData()
//        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionVwWalkThru.dequeueReusableCell(withReuseIdentifier: "WalkThruCell", for: indexPath) as? WalkThruCell
        print(dataArr[indexPath.row])
        cell?.dataToPlace = dataArr[indexPath.row]
        if let dataToPlace = cell?.dataToPlace {
            cell?.applyValues(dataToDisplay: dataToPlace)
        }
        return cell!
    }
    
    @IBOutlet weak var collectionVwWalkThru: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
