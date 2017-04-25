#
# Be sure to run `pod lib lint TweenKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SBSwiftUtils'
  s.version          = '0.1.0'
  s.summary          = 'Collection of Swift utilities'

  s.description      = <<-DESC
Mostly extensions for Foundation types
                       DESC

  s.homepage         = 'https://github.com/SteveBarnegren/SBSwiftUtils'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'steve.barnegren@gmail.com' => 'steve.barnegren@gmail.com' }
  s.source           = { :git => 'https://github.com/SteveBarnegren/SBUtils.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/SteveBarnegren'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SBSwiftUtils/*.swift'

end