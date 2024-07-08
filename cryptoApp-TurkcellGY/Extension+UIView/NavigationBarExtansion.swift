//
//  NavigationBarExtansion.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 4.07.2024.
//

import Foundation
import UIKit


extension UINavigationBar {
    
    
    func setCenterView(title: String?, image: UIImage?) {
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        
        if let image = image {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: -10, y: 9, width: 30, height: 30)
            containerView.addSubview(imageView)
        }

        if let title = title {
            let titleLabel = UILabel(frame: CGRect(x: 0, y: 5, width: 170, height: 44))
            titleLabel.text = title
            titleLabel.font = .systemFont(ofSize: 20, weight: .black)
            titleLabel.textAlignment = .center
            titleLabel.textColor = .white
            containerView.addSubview(titleLabel)
        }

        self.topItem?.titleView = containerView
    }
}
