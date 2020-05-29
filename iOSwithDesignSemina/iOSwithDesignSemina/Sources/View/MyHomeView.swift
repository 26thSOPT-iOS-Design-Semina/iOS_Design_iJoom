//
//  MyHomeView.swift
//  iOSwithDesignSemina
//
//  Created by IJ . on 2020/05/26.
//  Copyright © 2020 jun. All rights reserved.
//

import Foundation
import UIKit

class MyHomeView: UIView {
    private let xibName = "MyHomeView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}
