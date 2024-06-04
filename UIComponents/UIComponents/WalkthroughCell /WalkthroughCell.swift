//
//  WalkthroughCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 4.06.2024.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

public class WalkthroughCell: UICollectionViewCell, ReusableView {
    
    private let imageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    
    private let containerView = UIViewBuilder()
        .build()
    
    private let labelStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(10)
        .build()
    
    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xxLarge))
        .textAlignment(.center)
        .textColor(.white)
        .build()
    
    private let descriptionLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textAlignment(.center)
        .textColor(.black)
        .numberOfLines(0)
        .build()

    weak var viewModel: WalkthroughCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
}

// MARK: - UILayout
extension WalkthroughCell {
    
    private func addSubviews() {
        addImageView()
        addContainerView()
        contentView.backgroundColor = .white
    }
    
    private func addImageView() {
        contentView.addSubview(imageView)
        imageView.edgesToSuperview(excluding: .bottom, insets: UIEdgeInsets(top: 200, left: 50, bottom: 0, right: 50))
        imageView.centerYToSuperview()
        imageView.aspectRatio(1)
    }
    
    private func addContainerView() {
        contentView.addSubview(containerView)
        containerView.topToBottom(of: imageView)
        containerView.edgesToSuperview(excluding: .top)
        
        containerView.addSubview(labelStackView)
        
        labelStackView.centerYToSuperview()
        labelStackView.leadingToSuperview().constant = 50
        labelStackView.trailingToSuperview().constant = -50
        
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(descriptionLabel)
    }
}

// MARK: - SetViewModel
extension WalkthroughCell {

    public func set(viewModel: WalkthroughCellProtocol) {
        self.viewModel = viewModel
        self.imageView.image = viewModel.image
        self.titleLabel.text = viewModel.titleLabel
        self.descriptionLabel.text = viewModel.descriptionLabel
    }
}


