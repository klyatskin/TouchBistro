//
//  Menu.swift
//  POS
//
//  Created by Tayson Nguyen on 2019-04-23.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import Foundation
import CalculationPoS

func category(_ category: String) -> (String, NSDecimalNumber) -> Item {
    return { name, price in
        return (name, category, price, false)
    }
}

let appetizers = category("Appetizers")
let mains = category("Mains")
let drinks = category("Drinks")
let alcohol = category("Alcohol")

let appetizersCategory: [Item] = [
    appetizers("Nachos", 13.99),
    appetizers("Calamari", 11.99),
    appetizers("Caesar Salad", 10.99),
]

let mainsCategory: [Item] = [
    mains("Burger", 9.99),
    mains("Hotdog", 3.99),
    mains("Pizza", 12.99),
]

let drinksCategory: [Item] = [
    drinks("Water", 0),
    drinks("Pop", 2.00),
    drinks("Orange Juice", 3.00),
]

let alcoholCategory: [Item] = [
    alcohol("Beer", 5.00),
    alcohol("Cider", 6.00),
    alcohol("Wine", 7.00),
]

let tax1: TaxType = ("Tax 1 (5%)", 0.05, EnableConstants.isEnabled)
let tax2: TaxType = ("Tax 2 (8%)", 0.08, EnableConstants.isEnabled)
let alcoholTax: TaxType = ("Alcohol Tax (10%)", 0.10, EnableConstants.isEnabled)

let discount5Dollars: DiscountType = ("$5.00", 5.00, EnableConstants.isDisabled, DiscountConstants.isAbsoluteDiscount)
let discount10Percent: DiscountType = ("10%", 0.10, EnableConstants.isDisabled, DiscountConstants.isPercentileDiscount)
let discount20Percent: DiscountType = ("20%", 0.20, EnableConstants.isDisabled, DiscountConstants.isPercentileDiscount)

var taxes: [TaxType] = [
    tax1,
    tax2,
    alcoholTax,
]

var discounts: [DiscountType] = [
    discount5Dollars,
    discount10Percent,
    discount20Percent,
]

var categories: [CategoryType] = [
    ("Appetizers", appetizersCategory, nil),
    ("Mains", mainsCategory, nil),
    ("Drinks", drinksCategory, nil),
    ("Alcohol", alcoholCategory, [alcoholTax]),
]
