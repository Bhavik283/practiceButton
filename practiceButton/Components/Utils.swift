//
//  Utils.swift
//  practiceButton
//
//  Created by Bhavik Goyal on 07/02/24.
//

import UIKit

typealias ConstraintFactory = (_ parentView: UIView, _ childView: UIView) -> [NSLayoutConstraint]

typealias Constraint = (_ view: UIView, _ otherView: UIView?) -> NSLayoutConstraint

func constraint<A, L>(_ from: KeyPath<UIView, A>, _ to: KeyPath<UIView, A>? = nil, multiplier: CGFloat? = nil, constant: CGFloat = 0, priority: UILayoutPriority? = nil) -> Constraint where A: NSLayoutAnchor<L> {
    return { view, otherView in
        guard let otherView = otherView else { fatalError("Pairing view missing") }
        var partialConstraint: NSLayoutConstraint
        let to = to ?? from
        partialConstraint = view[keyPath: from].constraint(equalTo: otherView[keyPath: to], constant: constant)

        return fullConstraint(from: partialConstraint, withMultiplier: multiplier, priority: priority)
    }
}

func fullConstraint(from partialConstraint: NSLayoutConstraint, withMultiplier multiplier: CGFloat? = nil, priority: UILayoutPriority?) -> NSLayoutConstraint {
    var constraint = partialConstraint
    if let multiplier = multiplier {
        constraint = NSLayoutConstraint(item: constraint.firstItem as Any,
                                        attribute: constraint.firstAttribute,
                                        relatedBy: constraint.relation,
                                        toItem: constraint.secondItem,
                                        attribute: constraint.secondAttribute,
                                        multiplier: multiplier,
                                        constant: constraint.constant)
    }
    if let priority = priority {
        constraint.priority = priority
    }
    return constraint
}

public func mergeDict<T, K>(base: [T: K], otherDicts: [[T: K]]) -> [T: K] {
    var mergedDict = base
    for attributes in otherDicts {
        mergedDict = mergedDict.merging(attributes, uniquingKeysWith: { _, new in new })
    }
    return mergedDict
}

public func setUpBox<T, K>(view: UIView, attributes: [T: K]) {
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIView, UIColor?>, UIColor) in attributes {
        view[keyPath: dictkey] = dictvalue
    }

    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIView, CGFloat>, CGFloat) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIView, CGColor?>, CGColor) in attributes {
        view[keyPath: dictkey] = dictvalue
    }

    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIView, CGSize>, CGSize) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIView, Bool>, Bool) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIView, Float>, Float) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
}

public func setUpText<T, K>(view: UILabel, attributes: [T: K]) {
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UILabel, UIFont?>, UIFont) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UILabel, UIColor?>, UIColor) in attributes {
        view[keyPath: dictkey] = dictvalue
    }

    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UILabel, NSLineBreakMode>, NSLineBreakMode) in attributes {
        view[keyPath: dictkey] = dictvalue
    }

    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UILabel, Int>, Int) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UILabel, NSTextAlignment>, NSTextAlignment) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UILabel, Bool>, Bool) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UILabel, String?>, String) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UILabel, CGFloat>, CGFloat) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
}

public func setUpImage<T, K>(view: UIImageView, attributes: [T: K]) {
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIImageView, UIView.ContentMode>, UIView.ContentMode) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIImageView, CGFloat>, CGFloat) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIImageView, UIColor?>, UIColor) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIImageView, CGSize>, CGSize) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIImageView, Bool>, Bool) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIImageView, UIImage?>, UIImage) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
}

public func setUpStack<T, K>(view: UIStackView, attributes: [T: K]) {
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIStackView, CGFloat>, CGFloat) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIStackView, UIStackView.Alignment>, UIStackView.Alignment) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIStackView, NSLayoutConstraint.Axis>, NSLayoutConstraint.Axis) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIStackView, UIStackView.Distribution>, UIStackView.Distribution) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIStackView, Bool>, Bool) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
    for case let (dictkey, dictvalue) as (ReferenceWritableKeyPath<UIStackView, UIColor?>, UIColor) in attributes {
        view[keyPath: dictkey] = dictvalue
    }
}

extension UIView {
    func updateConstraints<T: UIView>(_ subview: T, constraints: [ConstraintFactory]) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        _ = constraints.map { getConstraint in NSLayoutConstraint.activate(getConstraint(self, subview)) }
    }

    func constrain(with constraints: [Constraint]) {
        translatesAutoresizingMaskIntoConstraints = false

        var allConstraints = [NSLayoutConstraint]()
        for constraintFn in constraints {
            allConstraints.append(constraintFn(self, nil))
        }
        removeViewConstraints(for: allConstraints)
        NSLayoutConstraint.activate(allConstraints)
    }

    func constrainTo(_ to: UIView, withConstraints constraints: [Constraint]) {
        to.translatesAutoresizingMaskIntoConstraints = false

        var allConstraints = [NSLayoutConstraint]()
        for constraintFn in constraints {
            allConstraints.append(constraintFn(to, self))
        }
        removeViewConstraints(for: allConstraints)
        NSLayoutConstraint.activate(allConstraints)
    }

    func removeViewConstraints(of view: UIView? = nil, for constraints: [NSLayoutConstraint]) {
        let view = view ?? self
        for viewConstraint in view.constraints {
            for constraint in constraints {
                if constraint.firstAttribute == viewConstraint.firstAttribute {
                    view.removeConstraint(viewConstraint)
                }
            }
        }
    }
}

public func getAttrs(base: [AnyHashable: Any], common: [AnyHashable: Any], combined: [[AnyHashable: Any]], combinedKeys: [[String]], classAttrs: [String: String]) -> [AnyHashable: Any] {
    var newDict = [AnyHashable: Any]()

    _ = base.map {
        key, _ -> [AnyHashable: Any] in
        var mergedDicts = base[key] as! [AnyHashable: Any]

        for (label, data) in classAttrs {
            // Merge common with base attrs
            let attr = ((common[label] as? [AnyHashable: Any])?[data] as? [AnyHashable: Any])?[key]
            if attr != nil {
                mergedDicts = mergeDict(base: mergedDicts, otherDicts: [attr as! [AnyHashable: Any]])
            }
            // Merge combined with base & common attrs
            for other in combined {
                if combinedKeys.count > 0 {
                    for combineKey in combinedKeys {
                        let firstKeyValue = classAttrs[combineKey[0]]
                        let secondKeyValue = classAttrs[combineKey[1]]
                        let otherAttr = ((other[firstKeyValue!] as? [AnyHashable: Any])?[secondKeyValue!] as? [AnyHashable: Any])?[key]
                        if otherAttr != nil {
                            mergedDicts = mergeDict(base: mergedDicts, otherDicts: [otherAttr as! [AnyHashable: Any]])
                        }
                    }
                } else {
                    for keyType in classAttrs.keys {
                        let otherAttr = ((other[data] as? [AnyHashable: Any])?[classAttrs[keyType]!] as? [AnyHashable: Any])?[key]
                        if otherAttr != nil {
                            mergedDicts = mergeDict(base: mergedDicts, otherDicts: [otherAttr as! [AnyHashable: Any]])
                        }
                    }
                }
            }
        }
        newDict[key] = mergedDicts
        return [String.self(describing: key): mergedDicts]
    }
    return newDict
}

public func setUpAttrs(for layers: [String: UIView], with attrs: [AnyHashable: Any]) {
    for (key, value) in layers {
        if key == "root" { continue }
        let attributes = attrs[key] as! [AnyHashable: Any]
        let constraints = attributes["constraints"] as? [String: Any] ?? [:]
        let parent = attributes["parent"] as? String ?? "root"
        switch key {
        case _ where key.lowercased().contains("box"):
            setUpBox(view: value, attributes: attributes)
        case _ where key.lowercased().contains("text"):
            setUpText(view: value as! UILabel, attributes: attributes)
        case _ where key.lowercased().contains("icon"):
            setUpImage(view: value as! UIImageView, attributes: attributes)
        case _ where key.lowercased().contains("stack"):
            setUpStack(view: value as! UIStackView, attributes: attributes)
        default:
            return
        }
        updateConstraintsOnLayer(layers: layers, child: value, constraints: constraints, parent: parent)
    }
}

public func setUpLayers(for layers: [String: UIView], base: [AnyHashable: Any], common: [AnyHashable: Any], combined: [AnyHashable: Any]..., combinedKeys: [String]...) {
    let baseLayer = layers["root"]!
    let classVariables = Mirror(reflecting: baseLayer)

    var keys = [String]()
    for (key, _) in common {
        keys.append(key as! String)
    }

    var classAttrs = [String: String]()
    for (label, value) in classVariables.children {
        if keys.contains(label!) {
            classAttrs[label!] = String(describing: value)
        }
    }
    let allAttrs = getAttrs(base: base, common: common, combined: combined, combinedKeys: combinedKeys, classAttrs: classAttrs)
    setUpAttrs(for: layers, with: allAttrs)
}

public func updateConstraintsOnLayer(layers: [String: UIView], child: UIView, constraints: [String: Any], parent: String) {
    let constrainstFunctions = [ConstraintFactory]()
    let parent = layers[parent]!

    for (key, value) in constraints {
        switch key {
        case "size":
            child.constrain(with: value as! [Constraint])
        case "main":
            parent.constrainTo(child, withConstraints: value as! [Constraint])
        case "removeSize":
            var allConstraints = [NSLayoutConstraint]()
            for constraintFn in value as! [Constraint] {
                allConstraints.append(constraintFn(child, nil))
            }
            parent.removeViewConstraints(for: allConstraints)
        case "removeMain":
            var allConstraints = [NSLayoutConstraint]()
            for constraintFn in value as! [Constraint] {
                allConstraints.append(constraintFn(parent, child))
            }
            parent.removeViewConstraints(for: allConstraints)
        default:
            return
        }
    }
    parent.updateConstraints(child, constraints: constrainstFunctions)
}
