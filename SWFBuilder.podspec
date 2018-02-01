Pod::Spec.new do |s|
s.name        = 'SWFBuilder'
s.version     = '1.0.0'
s.authors     = { 'ruibox001' => 'wangshengyuancrazy@163.com' }
s.homepage    = 'https://github.com/ruibox001/SWFBuilder'
s.summary     = 'SWFBuilder 快速编程组件'
s.source      = { :git => 'https://github.com/ruibox001/SWFBuilder.git',:tag => "v#{s.version}" }
s.license     = { :type => "MIT", :file => "LICENSE" }
s.platform = :ios, '8.0'
s.requires_arc = true
s.source_files  = "SWFBuilder/*"
s.public_header_files = "SWFBuilder/*.swift"
s.framework  = "UIKit"
s.ios.deployment_target = '8.0'
end