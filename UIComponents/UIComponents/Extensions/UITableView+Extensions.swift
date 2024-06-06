//
//  UITableView+Extensions.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 6.06.2024.
//

import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T where T: ReusableView {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue header/footer view with identifier: \(T.reuseIdentifier)")
        }
        return view
    }
}
