//
//  GemViewController1.swift
//  NewSportsProject
//
//  Created by user on 16/05/18.
//  Copyright © 2018 agaraminfotech. All rights reserved.
//

import UIKit
import Gemini
import SDWebImage

//@objc class GemViewController1: UIViewController {
//
//        @IBOutlet weak var collectionView: GeminiCollectionView! {
//            didSet {
//                let nib = UINib(nibName: cellIdentifier, bundle: nil)
//                collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
//                collectionView.delegate   = self
//                collectionView.dataSource = self
////                collectionView.backgroundColor = UIColor(red: 255 / 255, green: 212 / 255, blue: 100 / 255, alpha: 1)
//                collectionView.gemini
//                    .yawRotationAnimation()
//                    .scale(0.7)
//                    .yawEffect(rotationEffect)
//            }
//        }
//
//        fileprivate let cellIdentifier = "ImageCollectionViewCell"
//        private(set) var rotationEffect: YawRotationEffect = .yawUp
//        private(set) var scrollDirection: UICollectionViewScrollDirection = .horizontal
//
//        fileprivate let images = ["building", "food", "japan", "minions", "nature", "people"]
//
//
//        public class func make(scrollDirection: UICollectionViewScrollDirection, effect: YawRotationEffect) -> GemViewController1 {
//            let storyboard = UIStoryboard(name: "main", bundle: nil)
//            let viewController = storyboard.instantiateViewController(withIdentifier: "YawRotationViewController") as! GemViewController1
//            viewController.rotationEffect  = effect
//            viewController.scrollDirection = scrollDirection
//
//            return viewController
//        }
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//            //    let viewController = YawRotationViewController.make(scrollDirection: .vertical, effect: .yawDown)
//            //    navigationController?.pushViewController(viewController, animated: true)
//
//            self.rotationEffect = .yawDown
//            self.scrollDirection = .vertical
//            let layout = UICollectionViewPagingFlowLayout()
//            layout.scrollDirection = scrollDirection
//            layout.itemSize = CGSize(width: view.bounds.width/2, height: view.bounds.width/2)
//            let cellHeight: CGFloat = view.bounds.width - 70
//            layout.sectionInset = UIEdgeInsets(top: (view.bounds.height - cellHeight) / 2, left: 150, bottom: (view.bounds.height - cellHeight) / 2, right: 25)
//            layout.minimumLineSpacing = 40
//            layout.minimumInteritemSpacing = 40
//            collectionView.collectionViewLayout = layout
//            collectionView.decelerationRate = UIScrollViewDecelerationRateFast
//
//        }
//
//    }
//
//    // MARK: - UIScrollViewDelegate
//    extension GemViewController1 {
//        func scrollViewDidScroll(_ scrollView: UIScrollView) {
//            collectionView.animateVisibleCells()
//        }
//    }
//
//    // MARK: - UICollectionViewDelegate
//    extension GemViewController1: UICollectionViewDelegate {
//        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//            if let cell = cell as? GeminiCell {
//                self.collectionView.animateCell(cell)
//            }
//        }
//    }
//
//    // MARK: - UICollectionViewDataSource
//    extension GemViewController1: UICollectionViewDataSource {
//        @objc func numberOfSections(in collectionView: UICollectionView) -> Int {
//            return 1
//        }
//
//        @objc  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return images.count
//        }
//
//        @objc func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ImageCollectionViewCell
//            cell.configure(with: UIImage(named: images[indexPath.row])!)
//            self.collectionView.animateCell(cell)
//            return cell
//        }
//}
//
enum CustomAnimationType {
    case custom1
    case custom2

    func layout(withParentView parentView: UIView) -> UICollectionViewFlowLayout {
        switch self {
        case .custom1:
            let layout = UICollectionViewPagingFlowLayout()
            layout.itemSize = CGSize(width: parentView.bounds.width/3, height: parentView.bounds.height/3)
            layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom:10, right: 0)
            layout.minimumLineSpacing = 10
            layout.scrollDirection = .horizontal
            return layout
        case .custom2:
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 150, height: 150)
            layout.sectionInset = UIEdgeInsets(top: 15,
                                               left: (parentView.bounds.width - 150) / 2,
                                               bottom: 15,
                                               right: (parentView.bounds.width - 150) / 2)
            layout.minimumLineSpacing = 15
            layout.scrollDirection = .vertical
            return layout
        }
    }
}

final class GemViewController1: UIViewController {
    
    
    @IBOutlet weak var collectionView: GeminiCollectionView! {
        didSet {
            let nib = UINib(nibName: cellIdentifier, bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
            collectionView.delegate   = self
            collectionView.dataSource = self
        }
    }
    
    var responseArray = [Any]() //as! [String:Any]
    
    fileprivate let cellIdentifier = "ImageCollectionViewCell"
    
    fileprivate let images = ["building", "food", "japan", "minions", "nature", "people"]
    
    fileprivate var animationType: CustomAnimationType = .custom1
    
//    static func make(animationType: CustomAnimationType) -> GemViewController1 {
//        let storyboard = UIStoryboard(name: "CustomAnimationViewController", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "CustomAnimationViewController") as! GemViewController1
//        viewController.animationType = animationType
//        return viewController
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FetchCompetetionWebservice()
        
        // Setting of UICollectionViewFlowLayout
        if animationType == .custom1 {
            collectionView.collectionViewLayout = animationType.layout(withParentView: view)
            collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        } else {
            collectionView.collectionViewLayout = animationType.layout(withParentView: view)
        }
        
        // Setting of GeminiAnimation
        if animationType == .custom1 {
            collectionView.gemini
                .customAnimation()
                .translation(y: 50)
                .rotationAngle(y: 13)
                .ease(.easeOutExpo)
                .shadowEffect(.fadeIn)
                .maxShadowAlpha(0.3)
        } else {
            collectionView.gemini
                .customAnimation()
                .backgroundColor(startColor: UIColor(red: 38 / 255, green: 194 / 255, blue: 129 / 255, alpha: 1),
                                 endColor: UIColor(red: 89 / 255, green: 171 / 255, blue: 227 / 255, alpha: 1))
                .ease(.easeOutSine)
                .cornerRadius(75)
        }
    }
}

// MARK: - UIScrollViewDelegate
extension GemViewController1 {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.animateVisibleCells()
    }
}

// MARK: - UICollectionViewDelegate
extension GemViewController1: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? GeminiCell {
            self.collectionView.animateCell(cell)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        NSLog("indexpath \(indexPath.item)")
        
        
    }
    
}

// MARK: - UICollectionViewDataSource
extension GemViewController1: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.responseArray.count > 0 ? images.count : 0
//        return self.responseArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ImageCollectionViewCell
        
        // Set image only when animation type is custom1
        if animationType == .custom1 {
            
            cell.configure(with: UIImage(named: images[indexPath.row])!)
            
            let data : NSDictionary = self.responseArray[0] as! NSDictionary
            let url = URL(string: data["IMAGEURL"] as! String)
            cell.sampleImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "building"),options: SDWebImageOptions(rawValue: 0), completed: { (image, error, cacheType, imageURL) in
                // Perform operation.
            })
        }
        
        self.collectionView.animateCell(cell)
        return cell
    }
}

extension GemViewController1
{
    func FetchCompetetionWebservice() {
        
        let urlStr = URL(string: "http://192.168.0.152:8083/LiveMatch.svc/FETCHCOMPETITION")
        var urlReq : URLRequest = URLRequest(url: urlStr!)
        urlReq.httpMethod = "GET"
        let session : URLSession = URLSession(configuration: .default)
        
        
        let task : URLSessionTask = session.dataTask(with: urlReq) { (data : Data!, response : URLResponse!, error : Error!) in
            
            if error == nil,let usableData = data {
                
                do{
                    
                    let testdata = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                    self.responseArray = testdata["lstCompetitionList"] as! [Any]
                    
                    DispatchQueue.main.async{
                        self.collectionView.reloadData()
                    }
                }
                catch {
                    print("error trying to convert data to JSON")

                }
                
                NSLog("RESPONSE \(usableData)")

            }
        }
        task.resume()
        
        
        
    }
}


