//
//  BorderBottom.swift
//  MaterialDesign
//
//  Created by Mattia on 29/05/18.
//

import UIKit

@IBDesignable
public class BorderBottom: UIButton {

    @IBInspectable
    public var borderColor : UIColor = UIColor.blue
    @IBInspectable
    public var borderWidth : CGFloat = 2
    
    func setUp(){
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUp()
    }

}
