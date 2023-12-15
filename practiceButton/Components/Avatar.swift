//
//  Avatar.swift
//  practiceButton
//
//  Created by Bhavik Goyal on 14/12/23.
//

import UIKit

/**
 initials - text
 size
 kind
 disabled
 clickable
 */


public class pAvatar: UIView{
    public enum Kind {
        case icon
        case image(UIImage)
        case initials(String)
    }

    public enum Size {
        case xSmall
        case small
        case medium
        case large
        case xLarge
        case xxLarge
    }

    private enum State {
        case disabled
        case normal
    }
    
    public var pKind: Kind = .icon {
        didSet{
            updateConfigure()
        }
    }
    public var pSize: Size = .xSmall {
        didSet{
            updateConfigure()
        }
    }
    public var isClickable: Bool = false{
        didSet{
            updateConfigure()
        }
    }
    
    private var initials: String? {
        guard case let .initials(initials) = pKind else{
            return nil
        }
        let numberOfCharacters: Int = pSize == .xSmall ? 1 : 2
        let components = initials.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .whitespacesAndNewlines)
        switch (numberOfCharacters, components.count){
        case (_, 0):
            return ""
        case (_, 1):
            let stringInitial = String(components.first!.prefix(numberOfCharacters)).uppercased()
            return stringInitial
        case (1, _):
            return String(components.first!.prefix(1)).localizedUppercase
        case (2, _):
            return String(components.first!.prefix(1)).localizedUppercase + String(components.last!.prefix(1)).localizedUppercase
        default:
            return ""
        }
    }
    public var imageName: String = ""
    private var image: UIImage? {
        switch pKind {
        case .icon:
            imageName = "person"
            return UIImage(systemName: imageName)
        case let .image(image):
            imageName = "user image"
            return image
        default:
            imageName = ""
            return nil
        }
    }

    private var pAvatarState: State = .normal
    private var heightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private var widthConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private var imageHeightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private var imageWidthConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    private var contentView: UIControl = {
        let view = UIControl()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        return image
    }()
    private var initialView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func setAvatarState(_ value: Bool){
        if(!value){
            pAvatarState = .normal
        }else{
            pAvatarState = .disabled
        }
        updateConfigure()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(initialView)
        addSubview(contentView)
        contentView.backgroundColor = .systemMint
        setConstraints()
        applyConstraints()
        updateConfigure()
        contentView.addTarget(self, action: #selector(touchUpInsideAction), for: .touchUpInside)
    }
    
    private func setConstraints(){
        heightConstraint = contentView.heightAnchor.constraint(equalToConstant: 40)
        widthConstraint = contentView.widthAnchor.constraint(equalToConstant: 40)
        imageWidthConstraint = imageView.widthAnchor.constraint(equalToConstant: 18)
        imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 18)
        layer.cornerRadius = 20
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        imageWidthConstraint.isActive = true
        imageHeightConstraint.isActive = true
    }
    
    private func updateConfigure(){
        
        initialView.text = initials
        imageView.image = image
        alpha = pAvatarState == .disabled ? 0.5 : 1
        
        switch pSize {
        case .xSmall:
            heightConstraint.constant = 30
            widthConstraint.constant = 30
            layer.cornerRadius = 15
            initialView.font = UIFont(name: "Arial", size: 16)
            imageWidthConstraint.constant = 16
            imageHeightConstraint.constant = 16
        case .small:
            heightConstraint.constant = 40
            widthConstraint.constant = 40
            layer.cornerRadius = 20
            initialView.font = UIFont(name: "Arial", size: 18)
            imageWidthConstraint.constant = 18
            imageHeightConstraint.constant = 18
        case .medium:
            heightConstraint.constant = 50
            widthConstraint.constant = 50
            layer.cornerRadius = 25
            initialView.font = UIFont(name: "Arial", size: 23)
            imageWidthConstraint.constant = 23
            imageHeightConstraint.constant = 23
        case .large:
            heightConstraint.constant = 70
            widthConstraint.constant = 70
            layer.cornerRadius = 35
            initialView.font = UIFont(name: "Arial", size: 32)
            imageWidthConstraint.constant = 32
            imageHeightConstraint.constant = 32
        case .xLarge:
            heightConstraint.constant = 90
            widthConstraint.constant = 90
            layer.cornerRadius = 45
            initialView.font = UIFont(name: "Arial", size: 37)
            imageWidthConstraint.constant = 37
            imageHeightConstraint.constant = 37
        case .xxLarge:
            heightConstraint.constant = 120
            widthConstraint.constant = 120
            layer.cornerRadius = 60
            initialView.font = UIFont(name: "Arial", size: 56)
            imageWidthConstraint.constant = 56
            imageHeightConstraint.constant = 56
        }
        
        
        switch pKind {
        case .icon:
            imageView.tintColor = .systemBlue
            initialView.isHidden = true
            imageView.isHidden = false

        case .image:
            imageView.tintColor = .black
            initialView.isHidden = true
            imageView.isHidden = false

        case .initials:
            initialView.textColor = .black
            initialView.isHidden = false
            imageView.isHidden = true
        }

        
        
        
        
    }
    
    @objc private func touchUpInsideAction() {
        guard pAvatarState == .normal && isClickable else {
            return
        }
        self.clickAction?(self)
    }

    public var clickAction: ((pAvatar) -> Void)?
    
}

extension pAvatar{
    

    
    func applyConstraints(){
        let labelConstraints = [
            initialView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            initialView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        let imageConstraints = [
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(imageConstraints)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
