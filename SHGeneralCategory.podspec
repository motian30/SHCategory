Pod::Spec.new do |s|

  s.name         = "SHGeneralCategory"
  s.version      = "1.0.1"
  s.summary      = 'SHGeneralCategory...' 
  s.homepage     = 'https://github.com/motian30/SHCategory' 
  s.license  = 'MIT'
  s.authors  = { 'Motian' => 'llstc30@163.com' }
  s.platform     = :ios
  s.source   = { :git => 'https://github.com/motian30/SHCategory.git', :tag => s.version}
  s.source_files = 'SHCategory/**/*.{h,m}'
  s.public_header_files = 'SHCategory/**/*.h'
  s.frameworks = 'UIKit','Foundation','ImageIO'
  s.requires_arc = true

  s.dependency 'AFNetworking'
  s.dependency 'SVProgressHUD'
  s.dependency 'SDWebImage'
  s.dependency 'MJRefresh'
 

end
