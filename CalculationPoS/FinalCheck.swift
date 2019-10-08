//
//  Calculation.swift
//  CalculationPoS
//
//  Created by Konstantin Klyatskin on 2019-10-07.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import Foundation

@objc public protocol finalCheckObserverProtocol {
    func finalCheckDidChange(notification: Notification)
}

open class FinalCheck {
    
    public private(set) var subtotal: NSDecimalNumber = 1.1
    public private(set) var discount: NSDecimalNumber = 2.2
    public private(set) var tax: NSDecimalNumber = 3.3
    public private(set) var total: NSDecimalNumber = 4.4
    
    public init() {
    }
    
    public func update(cart:[Item], discounts:[DiscountType], taxes:[TaxType], categories: [CategoryType] ) {
        subtotal = 0
        discount = 0
        tax = 0
        total = 0.0
        
        cart.forEach( {
            let currentItem = $0
            subtotal = subtotal.adding(currentItem.price)
            
            taxes.forEach( {
                let currentTax = $0
                if (currentTax.isEnabled && (currentItem.isTaxExempt == false)) {
                    var taxToBeApplied = true
                    
                    let itemCategoryName = currentItem.category
                    categories.forEach( {
                        let currentCategory = $0
                        currentCategory.taxes?.forEach ( {
                            let currentCategoryTax = $0
                            if (currentCategoryTax.label == currentTax.label) {
                                taxToBeApplied = itemCategoryName == currentCategory.name
                            }
                        })
                    })
                    if (taxToBeApplied == true) {
                        tax = tax.adding(currentItem.price.multiplying(by: currentTax.amount))
                    }
                }
            })
        })
        
        total = subtotal.adding(tax)
        discounts.forEach({
            let tempDiscount = $0
            if (tempDiscount.isEnabled) {
                if (tempDiscount.isAbsolute) {
                    discount = discount.adding(tempDiscount.amount)
                } else {
                    discount = discount.adding(total.multiplying(by: tempDiscount.amount))
                }
            }
        })
        total = total.subtracting(discount)
    }
    
    
    public class func registerForCheckChange(object: finalCheckObserverProtocol) {
        NotificationCenter.default.addObserver(object, selector: #selector(object.finalCheckDidChange(notification:)), name: Notification.Name(CheckConstants.checkChangeNotificationId), object: nil)
        
    }
    
    public class func finalCheckDidChange() {
        NotificationCenter.default.post(name: Notification.Name(CheckConstants.checkChangeNotificationId), object: nil)
    }
    
}
