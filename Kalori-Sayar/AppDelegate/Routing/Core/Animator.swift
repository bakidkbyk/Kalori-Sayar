//
//  Animator.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 1.06.2024.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
