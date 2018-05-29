//
//  BaseTextField.swift
//  MaterialDesign
//
//  Created by Mattia on 29/05/18.
//

import UIKit

public class BaseTextField: UITextField, TextField {

    @IBOutlet
    public var nextField : TextField?
    @IBOutlet
    public var previusField : TextField?
    @IBInspectable
    public var showDone : Bool = true
    
    private var mostraBarra : Bool {
        return showDone || nextField != nil || previusField != nil
    }
    
    private lazy var doneBtn: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneBtn(_:)))
    }()
    
    private lazy var backBtn: UIBarButtonItem = {
        let ritorno = UIBarButtonItem(title: "<", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.backBtn(_:)))
        if self.previusField == nil {
            ritorno.isEnabled = false
        }
        return ritorno
    }()
    
    private lazy var nextBtn: UIBarButtonItem = {
        let ritorno = UIBarButtonItem(title: ">", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.nextBtn(_:)))
        if self.nextField == nil {
            ritorno.isEnabled = false
        }
        return ritorno
    }()
    
    lazy var barra: UINavigationItem = {
        let item = UINavigationItem(title: self.placeholder ?? "")
        item.rightBarButtonItem = self.doneBtn
        item.leftBarButtonItems = [self.backBtn, self.nextBtn]
        return item
    }()
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        if self.mostraBarra {
            let dimensioni = UIScreen.main.applicationFrame
            let barra = UINavigationBar(frame: CGRect(x: 0, y: -44, width: dimensioni.size.width, height: 44))
            barra.items = [self.barra]
            self.inputAccessoryView = barra
        }
    }

    @objc
    private func nextBtn(_ sender : UIBarButtonItem){
        guard let prossimo = self.nextField else {
            return
        }
        let _ = prossimo.becomeFirstResponder()
    }
    
    @objc
    private func backBtn(_ sender : UIBarButtonItem){
        guard let precedente = self.previusField else {
            return
        }
        let _ = precedente.becomeFirstResponder()
    }
    
    @objc
    private func doneBtn(_ sender : UIBarButtonItem){
        let _ = self.resignFirstResponder()
    }
    
    
    override public func resignFirstResponder() -> Bool {
        return super.resignFirstResponder()
    }
    
    override public func becomeFirstResponder() -> Bool {
        return super.becomeFirstResponder()
    }
}
