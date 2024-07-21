//
//  CaloriesCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 5.06.2024.
//

import Foundation

public protocol CaloriesCellDataSource: AnyObject {
    var foodLabel: String { get }
    var calorieLabel: String { get }
    var timeLabel: Date { get }
}

public protocol CaloriesCellEventSource: AnyObject {}

public protocol CaloriesCellProtocol: CaloriesCellDataSource, CaloriesCellEventSource {}

public final class CaloriesCellModel: CaloriesCellProtocol {
    
    public var foodLabel: String
    public var calorieLabel: String
    public var timeLabel: Date
    
    public init(foodItem: (name: String, calories: Int, time: Date)) {
        self.foodLabel = foodItem.name
        self.calorieLabel = "\(foodItem.calories) kcal"
        self.timeLabel = foodItem.time
    }
}
