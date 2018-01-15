Pod::Spec.new do |s|

  s.name         = "SHGeneralCategory"
  s.version      = "1.0.4"
  s.summary      = 'SHGeneralCategory...' 
  s.homepage     = 'https://github.com/motian30/SHCategory' 
  s.license  = 'MIT'
  s.authors  = { 'Motian' => 'llstc30@163.com' }
  s.platform     = :ios
  s.source   = { :git => 'https://github.com/motian30/SHCategory.git', :tag => s.version}
  s.source_files = 'SHCategory/SHCategory.h'
  s.public_header_files = 'SHCategory/SHCategory.h'
  s.frameworks = 'UIKit','Foundation','ImageIO'
  s.requires_arc = true

  s.dependency 'AFNetworking'
  s.dependency 'SVProgressHUD'
  s.dependency 'SDWebImage'
  s.dependency 'MJRefresh'
  
  s.subspec 'Constant' do |ss|
    ss.source_files = 'SHCategory/Constant/*.h'
    ss.public_header_files = 'SHCategory/Constant/*.h'
 
  end

  s.subspec 'Base' do |ss|
    ss.source_files = 'SHCategory/Base/**/*.{h,m}'
    ss.public_header_files = 'SHCategory/Base/**/*.h'
 
  end

  s.subspec 'GeneralCategory' do |ss|
    ss.source_files = 'SHCategory/GeneralCategory/**/*.{h,m}'
    ss.public_header_files = 'SHCategory/GeneralCategory/**/*.h'
    ss.dependency 'SHGeneralCategory/Constant'
    ss.dependency 'SHGeneralCategory/Extension'
    
  end

  s.subspec 'Extension' do |ss|
    ss.source_files = 'SHCategory/Extension/**/*.{h,m}'
    ss.public_header_files = 'SHCategory/Extension/**/*.h'
    ss.dependency 'SHGeneralCategory/Constant'
 
  end



  
  

 
end

