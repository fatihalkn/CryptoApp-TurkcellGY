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
        // Center view oluştur
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 140, height: 44))
        
        // Resim oluştur ve ekleyin
        if let image = image {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: -20, y: 5, width: 48, height: 48)
            containerView.addSubview(imageView)
        }
        
        // Başlık etiketini oluştur ve ekleyin
        if let title = title {
            let titleLabel = UILabel(frame: CGRect(x: 0, y: 5, width: 170, height: 44)) // Örnek boyut, ihtiyaca göre ayarlayabilirsiniz
            titleLabel.text = title
            titleLabel.font = .systemFont(ofSize: 20, weight: .black)
            titleLabel.textAlignment = .center
            titleLabel.textColor = .white // Başlığın rengini doğrudan belirleyin
            containerView.addSubview(titleLabel)
        }
        
        // Center view'ı navigation bar'a ekle
        self.topItem?.titleView = containerView
    }
}
