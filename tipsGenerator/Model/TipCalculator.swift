//
//  TipCalculator.swift
//  tipsGenerator
//
//  Created by Anisha Lamichhane on 7/6/21.
//

import Foundation
struct TipCalculator {
    var tips: Tips?
    
    func tipToFloat(tip: String) -> Float {
//    Remove the last character (%) from the title then turn it back into a String.
        let uiSegmentTitleMinusPercentageSign = String(tip.dropLast())
        
//        turn the string into a float
        guard let titleInFloat = Float(uiSegmentTitleMinusPercentageSign) else { return 0.0}
        
//        convert into percentage i.e. 1% = 0.01
         return titleInFloat / 100
        
        
    }
    
    mutating func calculateBill (billAmount: String, tip: Float, splitNo: String) {
        guard let billAmt = Float(billAmount) else { return}
        guard let splitNum = Float(splitNo) else { return}
      let  totalBillAmount = (billAmt * tip + billAmt) / splitNum
        tips = Tips(billAmount: totalBillAmount, tip: tip * 100, splitNumber: Int(splitNum))
    }
    
    func gettipInPc()-> Int {
        return Int(tips!.tip)
    }
    
    func getSplitNumber() -> Int {
        return tips!.splitNumber
    }
    func getSplitedPrice() -> String {
        return String(tips!.billAmount)
    }
}
