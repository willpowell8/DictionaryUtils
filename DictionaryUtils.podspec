#
# Be sure to run `pod lib lint DictionaryUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DictionaryUtils'
  s.version          = '0.4.7'
  s.summary          = 'Dictionary utilities that make life easier to reference the tree'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Some of the functions to be able to get keys where they are nested in a comporable way to json retrieval are added using this library.
                       DESC

  s.homepage         = 'https://github.com/willpowell8/DictionaryUtils'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'willpowell8' => 'willpowell8@gmail.com' }
  s.source           = { :git => 'https://github.com/willpowell8/DictionaryUtils.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/willpowelluk'

  s.ios.deployment_target = '8.0'
s.swift_version = '4.2'

  s.source_files = 'DictionaryUtils/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DictionaryUtils' => ['DictionaryUtils/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
