//
//  TextField.swift
//  MaterialDesign
//
//  Created by Mattia on 29/05/18.
//

import Foundation

@objc
public protocol TextField {
    func resignFirstResponder() -> Bool
    func becomeFirstResponder() -> Bool 
}
