#
#  Be sure to run `pod spec lint practiceButton.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "practiceButton"
  spec.version      = "0.0.1"
  spec.license      = { :type => 'BSD' }
  spec.homepage     = "http://EXAMPLE/practiceButton"
  spec.author       = { "Bhavik" => "bhavik.goyal@ril.com" }
  spec.summary      = "A short description of practiceButton."
  spec.source       = { :git => "http://EXAMPLE/practiceButton.git", :tag => "#{spec.version}" }
  spec.source_files = 'practiceButton/Components/*'
  spec.framework    = 'SystemConfiguration'
end

