//
//  ViewController.swift
//  BTAutoScrollView
//
//  Created by guntex01 on 5/16/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contendView: UIView!
    
    @IBOutlet weak var heightContendView: NSLayoutConstraint!
    @IBOutlet weak var widthContendView: NSLayoutConstraint!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var items = ["🌕", "🌖", "🌗", "🌔", "🌓"]
    let screenWidth = UIScreen.main.bounds.width

    var views = [CustomView]()

    var timer :Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageControl.numberOfPages = items.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .red
        pageControl.currentPageIndicatorTintColor =  .gray
        scrollView.isPagingEnabled = true
        setupScrollView1(arrays: items)
    

        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
    }
    @objc func moveToNextPage(){
        if self.scrollView.contentOffset.x < (self.scrollView.contentSize.width - (self.view.frame.width)){
            self.scrollView.contentOffset.x += self.view.bounds.width
        }
    }
    
    
    func setupScrollView1(arrays: [String]){
            for i in 0..<arrays.count{
                let item = CustomView(frame: CGRect(x: screenWidth/2 * CGFloat(i),
                                                     y: 0,
                                                     width: screenWidth,
                                                     height: 250))
                item.textIcon.text = arrays[i]
                contendView.addSubview(item)
            }
            
            widthContendView.constant = screenWidth * CGFloat(arrays.count)
            
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            setupScrollView1(arrays: items)
        }
        
    }

    extension ViewController: UIScrollViewDelegate{
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if scrollView == scrollView {
                let index = round(scrollView.contentOffset.x/screenWidth)
                pageControl.currentPage = Int(index)
            }
        }
    }

