//
//  CGFloat + Ext.swift
//  NetflixApp - MVVM
//
//  Created by Şafak Selim Sofioğlu on 25.06.2024.
//

import UIKit
extension UIViewController {
    var screenWidth: CGFloat {
        return view.frame.size.width
        //Ekranın tüm genişliğini verir
    }
    var screenHeight: CGFloat {
        return view.frame.size.height
    }
}

extension UIView {
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}
