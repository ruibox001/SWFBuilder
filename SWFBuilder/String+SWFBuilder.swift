//
//  String+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

extension String
{
    func strToColor() -> UIColor {
        return color(self)
    }
    
    func strToInt() -> Int {
        return Int(self)!
    }
    
    func strToFloat() -> CGFloat {
        return CGFloat((self as NSString).floatValue)
    }
    
    func strGetSize(_ font: UIFont, _ size: CGSize) -> CGSize {
        let rect = NSString(string: self).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return rect.size
    }
    
    func strGetHeight(_ font: UIFont, _ width: CGFloat) -> CGFloat {
        let size = self.strGetSize(font, CGSize.init(width: width, height: CGFloat(CGFloat.greatestFiniteMagnitude)))
        return size.height
    }
    
    func strGetWidth(_ font: UIFont, _ height: CGFloat) -> CGFloat {
        let size = self.strGetSize(font, CGSize.init(width: CGFloat(CGFloat.greatestFiniteMagnitude), height: height))
        return size.width
    }
    
    func strContain(_ str: String) -> Bool {
        return self.contains(str)
    }
    
    func strStartWith(_ str: String) -> Bool {
        return self.hasPrefix(str)
    }
    
    func strEndWith(_ str: String) -> Bool {
        return self.hasSuffix(str)
    }
    
    func strGetStringRange(_ str: String) -> NSRange {
        let sString: NSString = self as NSString
        let ids: NSRange = sString.range(of: str)
        return ids
    }
    
    func strGetStringPosition(_ str: String) -> Int {
        let ids: NSRange? = self.strGetStringRange(str)
        if ids?.location != NSNotFound {
            return (ids?.location)!
        }
        return -1
    }
    
    func strToNSURL() -> NSURL? {
        return NSURL(string: self)
    }
    
    func strToURL() -> URL? {
        return URL(string: self)
    }
    
    func strToNSRequest() -> NSURLRequest? {
        return NSURLRequest(url: self.strToURL()!)
    }
    
    func strToNSRequest(_ cachePolicy: NSURLRequest.CachePolicy) -> NSURLRequest? {
        return NSURLRequest.init(url: self.strToURL()!, cachePolicy: cachePolicy, timeoutInterval: 30)
    }
    
    func strToNSRequest(_ cachePolicy: NSURLRequest.CachePolicy, _ timeOut: TimeInterval) -> NSURLRequest? {
        return NSURLRequest.init(url: self.strToURL()!, cachePolicy: cachePolicy, timeoutInterval: timeOut)
    }
    
    func strToRequest() -> URLRequest? {
        return URLRequest(url: self.strToURL()!)
    }
    
    func strToRequest(_ cachePolicy: NSURLRequest.CachePolicy) -> URLRequest? {
        return URLRequest.init(url: self.strToURL()!, cachePolicy: cachePolicy, timeoutInterval: 30)
    }
    
    func strToRequest(_ cachePolicy: NSURLRequest.CachePolicy, _ timeOut: TimeInterval) -> URLRequest? {
        return URLRequest.init(url: self.strToURL()!, cachePolicy: cachePolicy, timeoutInterval: timeOut)
    }
    
    func strToImage() -> UIImage {
        return UIImage.init(named: self)!
    }
    
    func strImagePathToImage() -> UIImage {
        let path = Bundle.main.path(forResource: self, ofType: nil)
        return UIImage.init(contentsOfFile: path!)!
    }
    
    func strToData() -> Data {
        let url = URL(string:self)
        return try! Data(contentsOf: url!)
    }
    
    func strAppendStart(_ str: String) -> String {
        return str.appending(self)
    }
    
    func strAppendEnd(_ str: String) -> String {
        return self.appending(str)
    }
    
    func strIgnoreStr(_ str: String) -> String {
        return self.strReplaceStr(replace: str, by: "")
    }
    
    func strReplaceStr(replace: String, by: String) -> String {
        let ids: NSRange = self.strGetStringRange(replace)
        if ids.location != NSNotFound {
            let rIndex      = self.index(self.startIndex, offsetBy: ids.location)
            let rString     = self.prefix(upTo: rIndex)
            let bIndex      = self.index(self.endIndex, offsetBy: -(self.count - ids.length - rString.count))
            let bString     = self.suffix(from: bIndex)
            return "\(rString)\(by)\(bString)".strReplaceStr(replace:replace, by:by)
        }
        return self
    }
    
    func strReverse() -> String {
        return String(self.reversed())
    }
    
    func strToAttrbuteStr() -> NSAttributedString {
        return NSAttributedString.init(string: self)
    }
    
    func strToAttrbuteStr(_ font: UIFont) -> NSAttributedString {
        return AttributedString(self, font)
    }
    
    func strToAttrbuteStr(_ paragraphStyle: NSMutableParagraphStyle) -> NSAttributedString {
        return AttributedString(self, paragraphStyle)
    }
    
    func strToAttrbuteStr(_ font: UIFont, _ paragraphStyle: NSMutableParagraphStyle) -> NSAttributedString {
        return AttributedString(self, paragraphStyle, font)
    }
    
    func strToMutableAttrbuteStr() -> NSMutableAttributedString {
        return NSMutableAttributedString.init(string: self)
    }
    
    func strValidateRule(_ rule: String) -> Bool {
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,rule)
        return predicate.evaluate(with: self)
    }
    
    func strIsFloat() -> Bool {
        let scan: Scanner = Scanner.init(string: self)
        var float: Float = Float()
        return (scan.scanFloat(UnsafeMutablePointer(&float)) && scan.isAtEnd)
    }
    
    func strIsEmpty() -> Bool {
        if self.count == 0 {
            return true
        }
        return false
    }
    
    func strIsInt() -> Bool {
        let scan: Scanner = Scanner.init(string: self)
        var int: Int = 0
        return (scan.scanInt(UnsafeMutablePointer(&int)) && scan.isAtEnd)
    }
    
    
    
}

