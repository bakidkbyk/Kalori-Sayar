
//
//  AddWaterViewController.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 25.06.2024.
//

import UIKit
import MobilliumBuilders
import UIComponents
import TinyConstraints

final class AddWaterViewController: BaseViewController<AddWaterViewModel> {
    
    private let waterBottleImageView = UIImageViewBuilder()
        .build()
    
    private let bodyStackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    
    private let waterLabel = UILabelBuilder()
        .font(.font(.nunitoExtraBold, size: .xxxLarge))
        .textColor(.blue)
        .build()
    
    private let caloriesLabel = UILabelBuilder()
        .font(.font(.nunitoExtraBold, size: .xxLarge))
        .textColor(.blue)
        .build()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
    }
    
}

// MARK: - UILayout
extension AddWaterViewController {
    
    private func addSubviews() {
        view.addSubview(waterBottleImageView)
        waterBottleImageView.edgesToSuperview(excluding: [.trailing, .bottom], insets: .init(top: 20, left: 10, bottom: 0, right: 0), usingSafeArea: true)
        
        view.addSubview(bodyStackView)
        bodyStackView.centerY(to: waterBottleImageView)
        bodyStackView.leadingToTrailing(of: waterBottleImageView).constant = 10
        
        bodyStackView.addArrangedSubview(waterLabel)
        bodyStackView.addArrangedSubview(caloriesLabel)
    }
}

// MARK: - Configure Contents And Localize
extension AddWaterViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        waterBottleImageView.image = .icWaterBottle
    }
    
    private func setLocalize() {
        waterLabel.text = L10n.AddWater.water
        caloriesLabel.text = L10n.AddWater.calories
    }
    
}

// MARK: - Actions
extension AddWaterViewController {
}
