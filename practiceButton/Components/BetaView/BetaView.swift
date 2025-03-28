//
//  BetaView.swift
//  practiceButton
//
//  Created by Bhavik Goyal on 07/02/24.
//

import UIKit

@IBDesignable
public class MyComponent: UIView {
    public enum Kind {
        case normal
        case background
    }
    public enum Size {
        case small
        case medium
        case large
    }
    public enum State {
        case disabled
        case normal
    }
    public enum Orientation {
        case vertical
        case horizontal
    }

    private var stackView = UIStackView()
    private var titleLabel = UILabel()
    private var controlView = UIControl()
    private var iconView = UIImageView()
    
    private var kind: Kind = .normal {
        didSet {
            updateStyles()
        }
    }
    
    private var size: Size = .medium {
        didSet {
            updateStyles()
        }
    }
    
    private var state: State = .normal {
        didSet {
            updateStyles()
        }
    }
    
    private var orientation: Orientation = .horizontal {
        didSet {
            updateStyles()
        }
    }
    
    private var hasText: Bool?
    
    private var showIcon: Bool = true {
        didSet {
            updateStyles()
        }
    }
    
    public func setSize(_ value: Size) {
        size = value
    }
    
    public func setKind(_ value: Kind) {
        kind = value
    }
    
    public func setState(_ value: State) {
        state = value
    }
    
    public func setText(_ text: String) {
        titleLabel.text = text
    }
    
    public func setIcon(_ value: Bool) {
        showIcon = value
    }
    
    public func setOrientation(_ value: Orientation) {
        orientation = value
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
    
    private func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(titleLabel)
        controlView.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        titleLabel.text = "Value"
        
        iconView.image = UIImage(systemName: "house")
        updateStyles()
    }
    private func updateStyles() {
        let layers = ["root": self, "box": self, "stack": stackView, "icon": iconView, "text": titleLabel]
        let combineSizeKindKeys = ["size", "kind"]
        setUpLayers(for: layers, base: baseViewAttributeMap(hasText: titleLabel.text != ""), common: commoAttribute(hasText: titleLabel.text != ""), combined: sizeKindAttribute, combinedKeys: combineSizeKindKeys)
    }
    
    @objc private func onClick() {
        print("1")
    }
}
