//
//  CustomTapBar.swift
//  Coffe_House
//
//  Created by adyl CEO on 15/04/2024.
//

import UIKit

class CustomTapBar: UITabBar {
    
    private let scanQrButton = ScanQrButton(type: .system)
    
    override func draw(_ rect: CGRect) {
        configureShape()
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTabBar()
        setupScanQrButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBar() {
        tintColor = .systemOrange
        unselectedItemTintColor = .black
    }
    
    private func setupScanQrButton() {
        addSubview(scanQrButton)
        
        scanQrButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-60)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
            make.width.equalTo(scanQrButton.snp.height).multipliedBy(1.0)
        }
        
        scanQrButton.backgroundColor = .systemOrange
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        scanQrButton.frame.contains(point) ? scanQrButton : super.hitTest(point, with: event)
    }
}

extension CustomTapBar {
    
    private func configureShape() {
        let path = getTabBarPath()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.white.cgColor
        layer.insertSublayer(shape, at: 0)
    }
    
    private func getTabBarPath() -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 100, y: 0))
        
        path.addArc(withCenter: CGPoint(x: frame.width / 2, y: 0),
                    radius: 30,
                    startAngle: .pi,
                    endAngle: .pi * 2,
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        
        return path
    }
}
