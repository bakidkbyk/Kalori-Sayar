//
//  WalkthroughCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 4.06.2024.
//

import UIKit

public protocol WalkthroughCellDataSource: AnyObject {
    var image: UIImage { get }
    var titleLabel: String { get }
    var descriptionLabel: String { get }
}

public protocol WalkthroughCellEventSource: AnyObject {
    
}

public protocol WalkthroughCellProtocol: WalkthroughCellDataSource, WalkthroughCellEventSource {
    
}

public final class WalkthroughCellModel: WalkthroughCellProtocol {
    
    public var image: UIImage
    public var titleLabel: String
    public var descriptionLabel: String
    
    public init(image: UIImage, titleLabel: String, descriptionLabel: String) {
        self.image = image
        self.titleLabel = titleLabel
        self.descriptionLabel = descriptionLabel
    }
}
