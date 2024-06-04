//
//  PageControl.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 4.06.2024.
//

import UIKit

public class PageControl: UIPageControl {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    private func configureContents() {
        tintColor = .systemPurple
        pageIndicatorTintColor = UIColor.red.withAlphaComponent(0.3)
        currentPageIndicatorTintColor = .systemPurple
    }
}
