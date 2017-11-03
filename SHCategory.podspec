Pod::Spec.new do |s|

  s.name         = "SHCategory"

  s.version      = "0.0.1"

  s.summary      = 'SHCategory' 

  s.homepage     = 'https://github.com/motian30/SHCategory' 

  s.license  = 'MIT'

  s.authors  = { 'Motian' => 'llstc30@163.com' }

  s.platform     = :ios

  s.source   = { :git => 'https://github.com/motian30/SHCategory.git', :tag => s.version}
	
  s.source_files = 'SHCategory/**/*.{h,m}'

  #s.public_header_files = 'SHCategory/SHCategory.h'

  s.frameworks = 'UIKit','Foundation'

  s.requires_arc = true

end
