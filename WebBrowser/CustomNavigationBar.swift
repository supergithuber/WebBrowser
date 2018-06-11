//
//  CustomNavigationBar.swift
//  Lite
//
//  Created by wuxi on 2018/1/31.
//  Copyright © 2018年 Danis. All rights reserved.
//

import UIKit

class CustomNavigationBar: UIView {
    open var title:String?
    open var leftImage:String?
    open var rightImage:String?
    open var leftBlock: (() -> Void)?
    open var rightBlock: (() -> Void)?
    
    fileprivate let titleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    fileprivate let leftButton : UIButton = {
        let button = UIButton(type: .custom)
        
        return button
    }()
    fileprivate let rightButton : UIButton = {
        let button = UIButton(type: .custom)
        
        return button
    }()
    fileprivate let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    convenience init(frame:CGRect, title: String? = nil, leftImage:String? = nil, leftBlock:(() -> Void)? = nil, rightImage: String? = nil, rightBlock:(() -> Void)? = nil){
        self.init(frame: frame)
        if let title = title {
            self.titleLabel.text = title
        }
        if let leftImage = leftImage, let leftBlock = leftBlock{
            leftButton.setImage(UIImage.init(named: leftImage), for: .normal)
            self.leftBlock = leftBlock
        }
        if let rightImage = rightImage, let rightBlock = rightBlock{
            rightButton.setImage(UIImage.init(named: rightImage), for: .normal)
            self.rightBlock = rightBlock
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    fileprivate func commonSetup(){
        addSubview(titleLabel)
        addSubview(leftButton)
        addSubview(rightButton)
        addSubview(lineView)
        leftButton.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightAction), for: .touchUpInside)
        
        setupConstraints()
    }
    fileprivate func setupConstraints(){
        titleLabel.frame.size = CGSize(width: 270, height: 44)
        titleLabel.center.x = self.center.x
        titleLabel.frame.origin.y = self.bounds.height - 44

        leftButton.frame.size = CGSize(width: 44, height: 44)
        leftButton.frame.origin = CGPoint(x: 0, y: self.bounds.height - 44)

        rightButton.frame.size = CGSize(width: 44, height: 44)
        rightButton.frame.origin = CGPoint(x: self.bounds.width - 44, y:self.bounds.height - 44)

        lineView.frame = CGRect(x: 0, y: self.bounds.height - 0.5, width: self.bounds.width, height: 0.5)
    }
    @objc fileprivate func leftAction(_ sender: UIButton){
        leftBlock?()
    }
    @objc fileprivate func rightAction(_ sender: UIButton){
        rightBlock?()
    }
    
    
}
