#
# Be sure to run `pod lib lint PressableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PressableView'
  s.version          = '0.1.0'
  s.summary          = 'A pressable view that responds to presses by shrinking in size; alternative to a UIButton'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  "A pressable view that responds to presses by shrinking in size. Can be used as an alternative to a UIButton."
                       DESC

  s.homepage         = 'https://github.com/linusgeffarth/Pressable-View'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Linus Geffarth' => 'linus@geffarth.de' }
  s.source           = { :git => 'https://github.com/linusgeffarth/PressableView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/linusgeffarth'

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.0'

  s.source_files = 'PressableView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PressableView' => ['PressableView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  
end
