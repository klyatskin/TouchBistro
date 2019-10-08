//
//  Definitions.swift
//  CalculationPoS
//
//  Created by Konstantin Klyatskin on 2019-10-07.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import Foundation


public typealias Item = (name: String, category: String, price: NSDecimalNumber, isTaxExempt: Bool)

public typealias TaxType = (label: String, amount: NSDecimalNumber, isEnabled: Bool)

public typealias DiscountType = (label: String, amount: NSDecimalNumber, isEnabled: Bool, isAbsolute: Bool)




/**
 tax: tax specific categories only or all if nil
*/
public typealias CategoryType = (name:String, items:[Item], taxes: [TaxType]?)

public struct DiscountConstants {
    public static let isAbsoluteDiscount: Bool = true
    public static let isPercentileDiscount: Bool = !isAbsoluteDiscount
}
public struct EnableConstants {
    public static let isEnabled: Bool = true
    public static let isDisabled: Bool = !isEnabled
}


public struct CheckConstants {
    public static let checkChangeNotificationId: String = "checkChangeNotificationId"
}
