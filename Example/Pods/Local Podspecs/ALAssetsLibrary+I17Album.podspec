#
# Be sure to run `pod lib lint ALAssetsLibrary+I17Album.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ALAssetsLibrary+I17Album"
  s.version          = "0.1.0"
  s.summary          = "ALAssetsLibrary category for managing custom albums."
  s.description      = <<-DESC
  ALAssetsLibrary category for managing custom albums.
  ALAssetsLibrary category for managing custom albums.
  DESC
  s.homepage         = "https://github.com/ferhatozduran"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Ferhat Ozduran" => "ferhatozduran@gmail.com" }
  s.source           = { :git => "https://github.com/ferhatozduran/ALAssetsLibrary-I17Album.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'ALAssetsLibrary+I17Album' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'AssetsLibrary'
  # s.dependency 'AFNetworking', '~> 2.3'
end
