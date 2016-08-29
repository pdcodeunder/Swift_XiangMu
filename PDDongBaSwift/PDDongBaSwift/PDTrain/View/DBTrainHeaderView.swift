//
//  DBTrainHeaderView.swift
//  PDDongBaSwift
//
//  Created by 彭懂 on 16/8/25.
//  Copyright © 2016年 彭懂. All rights reserved.
//

import Foundation
import UIKit

public protocol DBTrainHeaderViewDelegate: NSObjectProtocol {
    func collectionViewCleckedCellNumber(number: NSInteger)
    func collectionPlayNumber(number: NSInteger)
}

class DBTrainHeaderView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var currentCount: NSInteger {
        get {
            if collectionView?.with == 0.0 || collectionView?.height == 0.0 {
                return 0
            }
            let index: NSInteger = Int((collectionView?.contentOffset.x)! / (collectionView?.with)!)
            return max(0, index)
        }
    }
    var collectionDataSource: [DBTrainModel] {
        get {
            return dataSource
        }
        set {
            self.dataSource = newValue
            collectionView?.reloadData()
            collectionView?.scrollToItemAtIndexPath(NSIndexPath.init(forItem: 0, inSection: 1), atScrollPosition: UICollectionViewScrollPosition.None, animated: NO)
            self.deleteTime()
            self.setUpTime()
        }
    }
    
    var nameLabel: UILabel?
    var dataSource: [DBTrainModel] = []
    weak var delegate: DBTrainHeaderViewDelegate?
    var collectionView: UICollectionView?
    var timer: NSTimer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let identifier: String = "tainHeaderCell"
    func createUI() {
        
        let flow: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.minimumLineSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.Horizontal
        collectionView = UICollectionView.init(frame: CGRectMake(0, 0, self.with, 200.0 / 667.0 * kScreenHeight), collectionViewLayout: flow)
        collectionView?.center = self.center
        collectionView?.backgroundColor = UIColor.grayColor()
        collectionView?.pagingEnabled = YES
        collectionView?.showsVerticalScrollIndicator = NO
        collectionView?.showsHorizontalScrollIndicator = NO
        collectionView?.scrollsToTop = NO
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.registerClass(DBTrainHeadCell.self, forCellWithReuseIdentifier: identifier)
        self.addSubview(collectionView!)
        
        nameLabel = UILabel.init(frame: CGRectMake(0, (collectionView?.bottom)!, collectionView!.with, (self.height - collectionView!.height ) * 0.5))
        nameLabel?.font = UIFont.systemFontOfSize(12)
        nameLabel?.textAlignment = NSTextAlignment.Center
        nameLabel?.text = "小球员：您好！欢迎来到动吧足球，你能学到最炫的足球技能。"
        self.addSubview(nameLabel!)
    }
    
    func timerDragging() {
        if self.dataSource.count == 0 {
            return
        }
        let targetIndex: NSInteger = self.currentCount
        self.scrollToIndex(targetIndex + 1)
    }
    
    func setUpTime() {
        timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: #selector(timerDragging), userInfo: nil, repeats: YES)
        NSRunLoop.mainRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
    }
    
    func deleteTime() {
        timer?.invalidate()
        timer = nil
    }
    
    func scrollToIndex(targetIndex: NSInteger) {
        collectionView?.scrollToItemAtIndexPath(NSIndexPath.init(forItem: targetIndex % self.collectionDataSource.count, inSection: targetIndex / self.collectionDataSource.count), atScrollPosition: UICollectionViewScrollPosition.None, animated: YES)
    }
    
    // 代理方法实现
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: DBTrainHeadCell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! DBTrainHeadCell
        let model: DBTrainModel = self.dataSource[indexPath.row]
        cell.fetchUIWithModel(model)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.with, collectionView.height)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let dele = delegate {
            dele.collectionViewCleckedCellNumber(indexPath.item)
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.deleteTime()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.setUpTime()
        if self.currentCount / self.collectionDataSource.count != 1 {
            collectionView?.scrollToItemAtIndexPath(NSIndexPath.init(forItem: self.currentCount % self.collectionDataSource.count, inSection: 1), atScrollPosition: UICollectionViewScrollPosition.None, animated: NO)
        }
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        if self.currentCount / self.collectionDataSource.count != 1 {
            collectionView?.scrollToItemAtIndexPath(NSIndexPath.init(forItem: self.currentCount % self.collectionDataSource.count, inSection: 1), atScrollPosition: UICollectionViewScrollPosition.None, animated: NO)
        }
    }
}
