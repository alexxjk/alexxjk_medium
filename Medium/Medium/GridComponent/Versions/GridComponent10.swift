//
//  GridComponent1.swift
//  Medium
//
//  Created by Alexander Martirosov on 5/22/18.
//  Copyright © 2018 Alexander Martirosov. All rights reserved.
//

import UIKit

class GridComponent10: UIStackView {
    
    private var cells: [UIView] = []
    
    private var currentRow: UIStackView?
    
    let rowSize: Int
    
    let rowHeight: CGFloat
    
    init(rowSize: Int, rowHeight: CGFloat) {
        self.rowSize = rowSize
        self.rowHeight = rowHeight
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fillEqually
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCell(view: UIView) {
        for view in self.currentRow?.arrangedSubviews ?? [UIView]() {
            if view is FakeCell {
                view.removeFromSuperview()
            }
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: self.rowHeight).isActive = true
        
        if self.currentRow == nil || self.cells.count % self.rowSize == 0 {
            self.currentRow = self.preapreRow()
            self.addArrangedSubview(self.currentRow!)
        }
        
        self.cells.append(view)
        
        self.currentRow!.addArrangedSubview(view)
        
        let fakeCellCount = self.rowSize - self.cells.count % self.rowSize
        for _ in 0..<fakeCellCount {
            self.currentRow!.addArrangedSubview(FakeCell())
        }
    }
    
    private func preapreRow() -> UIStackView {
        let row = UIStackView(arrangedSubviews: [])
        row.translatesAutoresizingMaskIntoConstraints = false
        row.axis = .horizontal
        row.distribution = .fillEqually
        return row
    }
    
    private class FakeCell: UIView {
        
    }
}
