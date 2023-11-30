//
//  TimeBoardView.swift
//  Taskcy
//
//  Created by 김시연 on 2023/11/27.
//

import Foundation
import UIKit

class TimeBoardView: UIView {
    override init(frame: CGRect) {
            super.init(frame: frame)
            loadView()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            loadView()
        }
        
        private func loadView() {
            let view = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! UIView
            view.frame = bounds
            addSubview(view)
        }
}
