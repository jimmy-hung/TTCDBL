#
# Be sure to run `pod lib lint TTCDBL.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TTCDBL'
  s.version          = '0.0.2'
  s.summary          = 'select @ && @'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jimmy-hung/TTCDBL'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'p5p50p5p@gmail.com' => 'p5p50p5p@gmail.com' }
  s.source           = { :git => 'https://github.com/jimmy-hung/TTCDBL.git', :tag => s.version.to_s }
  s.source           = { 'https://github.com/CocoaPods/Specs.git' }
  s.source           = { source 'https://bitbucket.org/larvata-tw/larvata-cocoapods-specs.git' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'TTCDBL/Classes/'
  s.swift_version = '4.0'
  s.dependency 'KKTouchPoints'
  s.dependency 'lottie-ios'
  s.dependency 'JPush'
  s.dependency 'Crashlytics'
  # s.resource_bundles = {
  #   'TTCDBL' => ['TTCDBL/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end