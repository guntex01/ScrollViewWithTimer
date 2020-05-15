//
//  CustomView.swift
//  BTAutoScrollView
//
//  Created by guntex01 on 5/16/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class CustomView: UIView {

let containerView : UIView = {
        let view = UIView()
        return view
    }()
    
    let textIcon : UILabel = {
       let label = UILabel()
        label.text = "🌕"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 80)
        label.textAlignment = .center
        return label
    }()
    
    func setupFrame(){
        containerView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        textIcon.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        textIcon.center = self.center
        self.addSubview(containerView)
        self.addSubview(textIcon)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupFrame()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
