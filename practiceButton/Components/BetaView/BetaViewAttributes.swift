//
//  BetaViewAttributes.swift
//  practiceButton
//
//  Created by Bhavik Goyal on 07/02/24.
//

import UIKit

internal func baseViewAttributeMap(hasText: Bool) -> [AnyHashable: Any] {
    return [
        "box": [
            \UIView.backgroundColor: UIColor(red: 119.0/255.0, green: 230.0/255.0, blue: 234.0/255.0, alpha: 1.0),
             \UIView.layer.cornerRadius: CGFloat(4.0),
             \UIView.layer.borderWidth: CGFloat(1.0),
             \UIView.alpha: CGFloat(1.0),
             \UIView.isAccessibilityElement: true,
             \UIView.isHidden: false
        ],
        "stack": [
            \UIStackView.axis: NSLayoutConstraint.Axis.horizontal,
             \UIStackView.alignment: UIStackView.Alignment.center,
             \UIStackView.spacing: CGFloat(6.0),
             \UIStackView.distribution: UIStackView.Distribution.fill,
             "parent": "box",
             "constraints": [
                "others": [constraint(\.leadingAnchor, constant: 8),
                           constraint(\.trailingAnchor, constant: -8),
                           constraint(\.topAnchor, constant: 4),
                           constraint(\.bottomAnchor, constant: -4)
                          ]
            ]
        ],
        "text": [
            \UILabel.numberOfLines: 1,
             \UILabel.textColor: UIColor(red: 14.0/255.0, green: 36.0/255.0, blue: 20.0/255.0, alpha: 1.0),
             \UILabel.font: UIFont(name: "Arial", size: 16.0)!
        ],
        "icon": [
            \UIImageView.tintColor: UIColor(red: 14.0/255.0, green: 36.0/255.0, blue: 20.0/255.0, alpha: 1.0),
             \UIImageView.isHidden: false,
             "constraints": [
                "sizeNew": [constraint(\.widthAnchor, constant: 16),
                            constraint(\.heightAnchor, constant: 16)]
             ]
        ]
    ]
}

internal func commoAttribute(hasText: Bool) -> [AnyHashable: Any] {
    return  [
        "state": [
            "disabled": [
                "box": [
                    \UIView.alpha: CGFloat(0.3)
                ]
            ]
        ],
        "kind": [
            "background": [
                "box": [
                    \UIView.backgroundColor: UIColor(red: 89.0/255.0, green: 89.0/255.0, blue: 89.0/255.0, alpha: 0.5),
                    \UIView.layer.cornerRadius: CGFloat(8.0),
                     \UIView.layer.borderWidth: CGFloat(0.0),
                ],
                "text": [
                    \UILabel.textColor: UIColor(red: 229.0/255.0, green: 228.0/255.0, blue: 227.0/255.0, alpha: 1)
                ],
                "icon": [
                    \UIImageView.tintColor: UIColor(red: 229.0/255.0, green: 228.0/255.0, blue: 227.0/255.0, alpha: 1)
                ]
            ]
        ],
        "size": [
            "small": [
                "stack": [
                    \UIStackView.spacing: hasText ? CGFloat(4.0): CGFloat(0.0),
                    "constraints": [
                       "others": [constraint(\.leadingAnchor, constant: 4),
                                  constraint(\.trailingAnchor, constant: -4),
                                  constraint(\.topAnchor, constant: 4),
                                  constraint(\.bottomAnchor, constant: -4)
                                 ]
                   ]
                ],
                "icon": [
                     "constraints": [
                        "sizeNew": [constraint(\.widthAnchor, constant: 12),
                                    constraint(\.heightAnchor, constant: 12)]
                     ]
                ],
                "text": [
                    \UILabel.font: UIFont(name: "Arial", size: 12.0)!
                ]
            ],
            "large": [
                "stack": [
                    \UIStackView.spacing: hasText ? CGFloat(8.0): CGFloat(0.0),
                    "constraints": [
                       "others": [constraint(\.leadingAnchor, constant: 12),
                                  constraint(\.trailingAnchor, constant: -12),
                                  constraint(\.topAnchor, constant: 8),
                                  constraint(\.bottomAnchor, constant: -8)
                                 ]
                   ]
                ],
                "icon": [
                     "constraints": [
                        "sizeNew": [constraint(\.widthAnchor, constant: 24),
                                    constraint(\.heightAnchor, constant: 24)]
                     ]
                ],
                "text": [
                    \UILabel.font: UIFont(name: "Arial", size: 24.0)!
                ]
            ]
        ],
        "orientation": [
            "vertical": [
                "stack": [
                    \UIStackView.axis: NSLayoutConstraint.Axis.vertical
                ]
            ]
        ],
        "showIcon": [
            "false": [
                "box": [
                    \UIView.isHidden: !hasText
                ],
                "icon": [
                    \UIImageView.isHidden: true
                ],
                "stack": [
                    \UIStackView.spacing: hasText ? CGFloat(4.0): CGFloat(0.0)
                ]
            ]
        ]
    ]
}

internal let sizeKindAttribute: [AnyHashable: Any] = [
    "small": [
        "normal": [
            "box": [
                \UIView.layer.cornerRadius: CGFloat(2.0)
            ]
        ],
        "background": [
            "box": [
                \UIView.layer.cornerRadius: CGFloat(4.0)
            ]
        ]
    ],
    "large": [
        "normal": [
            "box": [
                \UIView.layer.cornerRadius: CGFloat(6.0)
            ]
        ],
        "background": [
            "box": [
                \UIView.layer.cornerRadius: CGFloat(12.0)
            ]
        ]
    ]
]
