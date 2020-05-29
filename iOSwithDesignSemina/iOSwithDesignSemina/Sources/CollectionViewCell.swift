//
//  CollectionViewCell.swift
//  iOSwithDesignSemina
//
//  Created by IJ . on 2020/05/27.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var ddayLabel: UILabel!
    @IBOutlet weak var testButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        // cell rounded section
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        
       
       
        self.layer.masksToBounds = true
        
        
        self.layer.cornerRadius = 3.0
        layer.shadowRadius = 1
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize(width: 1.5, height: 3)
        self.clipsToBounds = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    func setup() {
        let view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
    }
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomCell", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
       
        return view
    }
}
