//
//  CaloriesCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 5.06.2024.
//

import Foundation

public protocol CaloriesCellDataSource: AnyObject {
    var foodLabel: String { get }
    var calorieLabel: Int { get }
}

public protocol CaloriesCellEventSource: AnyObject {}

public protocol CaloriesCellProtocol: CaloriesCellDataSource, CaloriesCellEventSource {}

public final class CaloriesCellModel: CaloriesCellProtocol {
    
    public var foodLabel: String
    public var calorieLabel: Int
    
    public init(foodItem: (name: String, calories: Int)) {
        self.foodLabel = foodItem.name
        self.calorieLabel = foodItem.calories
    }
}
