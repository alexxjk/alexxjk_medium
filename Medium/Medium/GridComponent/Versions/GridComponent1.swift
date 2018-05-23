//
//  GridComponent1.swift
//  Medium
//
//  Created by Alexander Martirosov on 5/23/18.
//  Copyright © 2018 Alexander Martirosov. All rights reserved.
//

import UIKit

class GridComponent: UIStackView {
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fillEqually
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
