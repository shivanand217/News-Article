//
//  LoaderView.swift
//  News-Article
//
//  Created by Apple on 19/09/20.
//

import Foundation
import UIKit

class Indicator:UIView {

    var blurImg = UIImageView()
    var indicator = UIActivityIndicatorView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = UIColor.black
        blurImg.isUserInteractionEnabled = true
        blurImg.alpha = 0.5
        indicator.style = .whiteLarge
        indicator.center = blurImg.center
        indicator.startAnimating()
        indicator.color = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showIndicator(){
        DispatchQueue.main.async( execute: {

            UIApplication.shared.keyWindow?.addSubview(self.blurImg)
            UIApplication.shared.keyWindow?.addSubview(self.indicator)
        })
    }
    func hideIndicator(){

        DispatchQueue.main.async( execute:
            {
                self.blurImg.removeFromSuperview()
                self.indicator.removeFromSuperview()
        })
    }
}
