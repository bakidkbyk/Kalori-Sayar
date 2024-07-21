//
//  BMIViewController.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 7.06.2024.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
import UIComponents

final class BMIViewController: BaseViewController<BMIViewModel> {
    
    private let scrollView = UIScrollViewBuilder()
        .build()
    
    private let contentView = UIViewBuilder()
        .build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(0)
        .build()
    
    private let backgroundImage = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    
    private let bmiCalculateTitleLabel = UILabelBuilder()
        .font(.font(.nunitoExtraBold, size: .xxLarge))
        .textAlignment(.center)
        .textColor(.gray)
        .numberOfLines(0)
        .build()
    
    private let sizeStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .build()
    
    private var sizeLabel = UILabelBuilder()
        .textColor(.gray)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    
    private let sizeCountLabel = UILabelBuilder()
        .textColor(.gray)
        .textAlignment(.right)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    
    private let sizeSlider = UISliderBuilder()
        .minimumValue(0)
        .maximumValue(3)
        .thumbTintColor(.primaryColor)
        .minimumTrackTintColor(.primaryColor)
        .build()
    
    private let weightStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .build()
    
    private var weightLabel = UILabelBuilder()
        .textColor(.gray)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    
    private let weightCountLabel = UILabelBuilder()
        .textColor(.gray)
        .textAlignment(.right)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    
    private let weightSlider = UISliderBuilder()
        .minimumValue(0)
        .maximumValue(200)
        .thumbTintColor(.primaryColor)
        .minimumTrackTintColor(.primaryColor)
        .build()
    
    private let calculateButton = UIButtonBuilder()
        .backgroundColor(.primaryColor)
        .tintColor(.white)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addScrollView()
        addSubviews()
        configureContents()
        setLocalize()
    }
}

// MARK: - UILayout
extension BMIViewController {
    
    private func addScrollView() {
        
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(usingSafeArea: true)
        
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .left(20) + .right(20))
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        
        contentStackView.addArrangedSubview(bmiCalculateTitleLabel)
        
        contentStackView.addArrangedSubview(backgroundImage)
        backgroundImage.height(300)
        
        contentStackView.addArrangedSubview(sizeStackView)
        sizeStackView.addArrangedSubview(sizeLabel)
        sizeStackView.addArrangedSubview(sizeCountLabel)
        
        contentStackView.addArrangedSubview(sizeSlider)
        
        contentStackView.addArrangedSubview(weightStackView)
        weightStackView.addArrangedSubview(weightLabel)
        weightStackView.addArrangedSubview(weightCountLabel)
        
        contentStackView.addArrangedSubview(weightSlider)
        contentStackView.setCustomSpacing(20, after: weightSlider)
        
        contentStackView.addArrangedSubview(calculateButton)
        calculateButton.height(60)
        
    }
}

// MARK: Configure Contents And Localize
extension BMIViewController {
    
    private func configureContents() {
        sizeSlider.addTarget(self, action: #selector(sizeSliderValueChanged(_:)), for: .valueChanged)
        sizeSlider.value = 1.5
        sizeCountLabel.text = "\(sizeSlider.value)m"
        
        weightSlider.addTarget(self, action: #selector(weightSliderValueChanged(_:)), for: .valueChanged)
        weightSlider.value = 0
        weightCountLabel.text = "\(weightSlider.value)kg"
        
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        bmiCalculateTitleLabel.text = L10n.Bmi.calculateBMITitle
        backgroundImage.image = .bmiBackground
        sizeLabel.text = L10n.Bmi.size
        weightLabel.text = L10n.Bmi.weight
        calculateButton.setTitle(L10n.Bmi.calculate, for: .normal)
    }
    
}
// MARK: - Actions
extension BMIViewController {
    
    @objc
    func sizeSliderValueChanged(_ sender: UISlider) {
        sizeCountLabel.text = String(format: "%.2f m", sender.value)
    }
    
    @objc
    func weightSliderValueChanged(_ sender: UISlider) {
        weightCountLabel.text = String(format: "%.1f kg", sender.value)
    }
    
    @objc
    func calculateButtonTapped() {
        let size = Double(sizeSlider.value)
        let weight = Double(weightSlider.value)
        
        let bmi = weight / (size * size)
        let bmiCategory: String
        
        switch bmi {
        case ..<18.5:
            bmiCategory = L10n.Bmi.underWeight
        case 18.5..<24.9:
            bmiCategory = L10n.Bmi.normalWeight
        case 25..<29.9:
            bmiCategory = L10n.Bmi.overWeight
        default:
            bmiCategory = L10n.Bmi.obesity
        }
        
        viewModel.goToBMIWarningUp(bmi: bmi, Category: bmiCategory)
    }
}
