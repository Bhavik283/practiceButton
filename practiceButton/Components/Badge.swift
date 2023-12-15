//
//  Badge.swift
//  practiceButton
//
//  Created by Bhavik Goyal on 14/12/23.
//

import UIKit

/**
 text
 icon
 size
 kind
 */

public class pBadge: UIView{
    public enum Size { case zero, small, medium, large }
    public enum Kind { case normal, service }
    
    public var pKind: Kind = .normal {
        didSet{
            updateConfigure()
        }
    }
    public var pSize: Size = .medium {
        didSet{
            updateConfigure()
        }
    }
    private var heightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private var imageWidthConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    public var pBadgeImage: String = "" {
        didSet{
            updateConfigure()
        }
    }
    public var ptext: String = "Badge" {
        didSet{
            updateConfigure()
        }
    }
    
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var labelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var badgeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(badgeImage)
        contentView.addSubview(labelText)
        addSubview(contentView)
        heightConstraint = contentView.heightAnchor.constraint(equalToConstant: 40)
        imageWidthConstraint = badgeImage.widthAnchor.constraint(equalToConstant: 0.0)
        imageWidthConstraint.isActive = true
        heightConstraint.isActive = true
        applyConstraints()
        updateConfigure()
    }
    
    
    private func updateConfigure(){
        badgeImage.image = UIImage(systemName: pBadgeImage)
        switch pKind {
        case .normal:
            
            labelText.text = ptext.uppercased()
            contentView.backgroundColor = .systemMint
            labelText.textColor = .white
            badgeImage.tintColor = .white
            
            switch pSize {
            case .zero:
                heightConstraint.constant = 0
                layer.cornerRadius = 0.0
                imageWidthConstraint.constant = 0
                labelText.font = UIFont(name: "Arial", size: 0)
            case .small:
                heightConstraint.constant = 30
                layer.cornerRadius = 4.0
                imageWidthConstraint.constant = pBadgeImage == "" ? 0 : 20
                labelText.font = UIFont(name: "Arial", size: 15)
            case .medium:
                heightConstraint.constant = 40
                layer.cornerRadius = 8.0
                imageWidthConstraint.constant = pBadgeImage == "" ? 0 : 30
                labelText.font = UIFont(name: "Arial", size: 20)
            case .large:
                heightConstraint.constant = 50
                layer.cornerRadius = 8.0
                imageWidthConstraint.constant = pBadgeImage == "" ? 0 : 40
                labelText.font = UIFont(name: "Arial", size: 30)
            }
        case .service:
            
            labelText.text = ptext
            contentView.backgroundColor = .systemGray2
            labelText.textColor = .white
            badgeImage.tintColor = .blue
            
            if(pSize != .zero){
                heightConstraint.constant = 40
                layer.cornerRadius = 20.0
                imageWidthConstraint.constant = pBadgeImage == "" ? 0 : 30
                labelText.font = UIFont(name: "Arial", size: 20)
            }else{
                heightConstraint.constant = 0
                layer.cornerRadius = 0.0
                labelText.font = UIFont(name: "Arial", size: 0)
            }
            
        }
        
    }
    
}

extension pBadge{
    func applyConstraints(){
        NSLayoutConstraint.activate([
            badgeImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            badgeImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            badgeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            
            labelText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            labelText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            labelText.leadingAnchor.constraint(equalTo: badgeImage.trailingAnchor, constant: 5),
            labelText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
