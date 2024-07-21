//
//  CaloriesCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 5.06.2024.
//

import UIKit
import MobilliumBuilders

public class CaloriesCell: UITableViewCell, ReusableView {
    
    private let foodLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.black)
        .build()
    
    private let calorieLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.black)
        .build()
    
    private let timeLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.black)
        .build()
    
    
    weak var viewModel: CaloriesCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
    }
}

// MARK: - UILayout
extension CaloriesCell {
    
    private func addSubviews() {
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(foodLabel)
        foodLabel.topToSuperview().constant = 10
        foodLabel.leadingToSuperview().constant = 20
        
        contentView.addSubview(calorieLabel)
        calorieLabel.topToSuperview().constant = 10
        calorieLabel.centerXToSuperview()
        
        contentView.addSubview(timeLabel)
        timeLabel.topToSuperview().constant = 10
        timeLabel.trailingToSuperview().constant = -20
    }
}

// MARK: - SetViewModel
extension CaloriesCell {
    
    public func set(viewModel: CaloriesCellProtocol) {
        self.viewModel = viewModel
        foodLabel.text = viewModel.foodLabel
        calorieLabel.text = String(viewModel.calorieLabel)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        timeLabel.text = dateFormatter.string(from: viewModel.timeLabel)
    }
}
