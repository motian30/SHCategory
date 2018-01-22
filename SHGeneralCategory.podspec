Pod::Spec.new do |s|

  s.name         = "SHGeneralCategory"
  s.version      = "1.1.1"
  s.summary      = 'SHGeneralCategory...' 
  s.homepage     = 'https://github.com/motian30/SHCategory' 
  s.license  = 'MIT'
  s.authors  = { 'Motian' => 'llstc30@163.com' }
  s.platform     = :ios,'7.0'
  s.source   = { :git => 'https://github.com/motian30/SHCategory.git', :tag => s.version}
  s.source_files = 'SHCategory/SHCategory.h'
  s.public_header_files = 'SHCategory/SHCategory.h'
  s.frameworks = 'UIKit','Foundation','ImageIO','CoreText'
  s.requires_arc = true
  
  s.subspec 'Constant' do |ss|
    ss.source_files = 'SHCategory/Constant/*.h'
    ss.public_header_files = 'SHCategory/Constant/*.h'
 
  end

  s.subspec 'GeneralCategory' do |ss|
    ss.dependency 'SHGeneralCategory/Constant'
    ss.dependency 'SVProgressHUD'
    ss.dependency 'AFNetworking'

      ss.subspec 'WKWebView' do |sss|
      sss.source_files = 'SHCategory/GeneralCategory/WKWebView/*.{h,m}'
      sss.public_header_files = 'SHCategory/GeneralCategory/WKWebView/*.h'
      sss.dependency 'SHGeneralCategory/Extension/UIColor'
 
      end

      ss.subspec 'TextView' do |sss|
      sss.source_files = 'SHCategory/GeneralCategory/TextView/*.{h,m}'
      sss.public_header_files = 'SHCategory/GeneralCategory/TextView/*.h'
      sss.dependency 'SHGeneralCategory/Extension/UIView'
 
      end
 
      ss.subspec 'ImageBrowser' do |sss|
      sss.source_files = 'SHCategory/GeneralCategory/ImageBrowser/*.{h,m}'
      sss.public_header_files = 'SHCategory/GeneralCategory/ImageBrowser/*.h'
      sss.dependency 'SDWebImage'
 
      end
 
      ss.subspec 'KeyChain' do |sss|
      sss.source_files = 'SHCategory/GeneralCategory/KeyChain/*.{h,m}'
      sss.public_header_files = 'SHCategory/GeneralCategory/KeyChain/*.h'
 
      end

      ss.subspec 'Alert' do |sss|
      sss.source_files = 'SHCategory/GeneralCategory/Alert/*.{h,m}'
      sss.public_header_files = 'SHCategory/GeneralCategory/Alert/*.h'
 
      end

      ss.subspec 'Network' do |sss|
      sss.source_files = 'SHCategory/GeneralCategory/Network/*.{h,m}'
      sss.public_header_files = 'SHCategory/GeneralCategory/Network/*.h'
      sss.dependency 'SHGeneralCategory/GeneralCategory/Obj-json'
 
      end

      ss.subspec 'Obj-json' do |sss|
      sss.source_files = 'SHCategory/GeneralCategory/Obj-json/*.{h,m}'
      sss.public_header_files = 'SHCategory/GeneralCategory/Obj-json/*.h'
 
      end

      ss.subspec 'Tool' do |sss|
      sss.source_files = 'SHCategory/GeneralCategory/Tool/*.{h,m}'
      sss.public_header_files = 'SHCategory/GeneralCategory/Tool/*.h'
 
      end
    
  end

  s.subspec 'Extension' do |ss|

      ss.subspec 'UIImage' do |sss|
      sss.source_files = 'SHCategory/Extension/UIImage/*.{h,m}'
      sss.public_header_files = 'SHCategory/Extension/UIImage/*.h'
 
      end

      ss.subspec 'UIView' do |sss|
      sss.source_files = 'SHCategory/Extension/UIView/*.{h,m}'
      sss.public_header_files = 'SHCategory/Extension/UIView/*.h'
 
      end
 
      ss.subspec 'UIButton' do |sss|
      sss.source_files = 'SHCategory/Extension/UIButton/*.{h,m}'
      sss.public_header_files = 'SHCategory/Extension/UIButton/*.h'
 
      end
 
      ss.subspec 'UIColor' do |sss|
      sss.source_files = 'SHCategory/Extension/UIColor/*.{h,m}'
      sss.public_header_files = 'SHCategory/Extension/UIColor/*.h'
 
      end

      ss.subspec 'NSDate' do |sss|
      sss.source_files = 'SHCategory/Extension/NSDate/*.{h,m}'
      sss.public_header_files = 'SHCategory/Extension/NSDate/*.h'
      sss.dependency 'SHGeneralCategory/Constant'
 
      end

      ss.subspec 'NSString' do |sss|
      sss.source_files = 'SHCategory/Extension/NSString/*.{h,m}'
      sss.public_header_files = 'SHCategory/Extension/NSString/*.h'
 
      end
 
  end

end

