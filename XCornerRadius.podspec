
Pod::Spec.new do |s|

 
  s.name         = "XCornerRadius"
  s.version      = "1.0.0"
  s.summary      = "A short description of XCornerRadius."

  s.description  = <<-DESC
			A Category to make cornerRadius for UIImageView have no Offscreen-Rendered, be more efficiency
                   DESC

  s.homepage     = "https://github.com/BerXiu/XCornerRadius"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  s.author             = { "BerXiu" => "502088292@qq.com" }

  # s.platform     = :ios
  s.platform     = :ios, "7.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/BerXiu/XCornerRadius.git", :tag => "1.0.0" }
  s.source_files  = "Classes", "XCornerRadius/XExtend/**/*.{h,m}"

  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"



  s.framework  = "UIKit"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
