#
#  Be sure to run `pod spec lint practiceButton.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "practiceButton"
  spec.version      = "1.1.0"
  spec.license      = { :type => 'MIT' }
  spec.platform     = :ios, "15.0"
  spec.homepage     = "https://github.com/Bhavik283/practiceButton"

  spec.author       = { "Bhavik" => "bhavik.goyal@ril.com" }
  spec.summary      = "practice button design system"
  spec.source       = { :git => "https://github.com/Bhavik283/practiceButton.git", :tag => "#{spec.version}" }
  spec.source_files = 'practiceButton/practiceButton/Components/**/*.swift'
  spec.framework    = 'UIKit'
  spec.swift_versions = "5.0"
end
