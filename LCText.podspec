Pod::Spec.new do |s|

  s.name         = "LCText"
  s.version      = "0.0.2"
  s.summary      = "。"

  s.homepage     = "https://github.com/mlcldh/LCText"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "mlcldh" => "1228225993@qq.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/mlcldh/LCText.git", :tag => "0.0.2" }
#  s.source_files = "LCText"
  s.source_files = 'LCText/**/*.{h,m}'
  s.frameworks = 'UIKit', 'Foundation'

  s.requires_arc = true
  s.static_framework = true
  
#  s.default_subspecs = ['main']
#
#  s.subspec 'main' do |ss|
#    ss.source_files = 'LCText/**/*.{h,m}'
#    ss.public_header_files = 'LCText/**/*.h'
#  end
  
  s.subspec 'LabelCategory' do |ss|
    ss.source_files = 'LCText/LabelCategory/*.{h,m,mm}'
    ss.public_header_files = 'LCText/LabelCategory/*.h'
  end

  s.subspec 'TextDidChange' do |ss|
    ss.source_files = 'LCText/TextDidChange/*.{h,m,mm}'
    ss.public_header_files = 'LCText/TextDidChange/*.h'
  end


  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

end
