//
//  BMIWarningUpViewController.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 13.06.2024.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
import UIComponents

final class BMIWarningUpViewController: BaseViewController<BMIWarningUpViewModel> {
    
    private let contentView = UIViewBuilder()
        .backgroundColor(.white)
        .build()
    
    private let backgroundImage = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    
    private let resultStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(15)
        .build()
    
    private let resultTitleLabel = UILabelBuilder()
        .font(.font(.nunitoExtraBold, size: .xxxLarge))
        .textAlignment(.center)
        .textColor(.gray)
        .build()
    
    private let resultCountLabel = UILabelBuilder()
        .font(.font(.nunitoExtraBold, size: .xxxLarge))
        .textAlignment(.center)
        .textColor(.primaryColor)      
        .build()
    
    private let bmiCategoryLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xxLarge))
        .textAlignment(.center)
        .textColor(.gray)
        .build()
    
    private let dissmissButton = UIButtonBuilder()
        .image(UIImage.icClose.withRenderingMode(.alwaysTemplate))
        .tintColor(.black)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
        view.backgroundColor = .white
    }
}

// MARK: - UILayout
extension BMIWarningUpViewController {
    
    private func addSubviews() {
        
        view.addSubview(backgroundImage)
        backgroundImage.centerXToSuperview()
        backgroundImage.topToSuperview().constant = 30
        backgroundImage.size(.init(width: 400, height: 400))
        
        view.addSubview(resultStackView)
        resultStackView.centerXToSuperview()
        resultStackView.topToBottom(of: backgroundImage).constant = 30
        
        resultStackView.addArrangedSubview(resultTitleLabel)
        resultStackView.addArrangedSubview(resultCountLabel)
        resultStackView.addArrangedSubview(bmiCategoryLabel)
        
        view.addSubview(dissmissButton)
        dissmissButton.topToSuperview(usingSafeArea: true).constant = 25
        dissmissButton.trailingToSuperview().constant = -20
        dissmissButton.size(.init(width: 22, height: 22))
    }
}

// MARK: - Configure Contents And Localize
extension BMIWarningUpViewController {
    
    private func configureContents() {
        view.backgroundColor = UIColor.clear.withAlphaComponent(0.50)
        view.isOpaque = false
        backgroundImage.image = .bmiWarningUp
        dissmissButton.addTarget(self, action: #selector(dissmissButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        resultTitleLabel.text = L10n.Bmi.result
        resultCountLabel.text = String(format: "%.2f", viewModel.bmi)
        bmiCategoryLabel.text = viewModel.category
    }
}

// MARK: - Actions
extension BMIWarningUpViewController {
    
    @objc
    func dissmissButtonTapped() {
        viewModel.closeRouter()
    }
}
