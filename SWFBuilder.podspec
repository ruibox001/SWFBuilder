Pod::Spec.new do |s|
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
s.compiler_flags = '-swift-version 4.0'
s.name        = 'SWFBuilder'
s.version     = '1.0.2'
s.authors     = { 'ruibox001' => 'wangshengyuancrazy@163.com' }
s.homepage    = 'https://github.com/ruibox001/SWFBuilder'
s.summary     = 'SWFBuilder 快速编程组件'
s.source      = { :git => 'https://github.com/ruibox001/SWFBuilder.git',:tag => "v1.0.3" }
s.license     = { :type => "MIT", :file => "LICENSE" }
s.platform = :ios, '9.0'
s.requires_arc = true
s.source_files  = "SWFBuilder/*.swift"
s.framework  = "UIKit","Foundation"
s.ios.deployment_target = '9.0'

s.pod_target_xcconfig = { "OTHER_SWIFT_FLAGS[config=Release]" => "-suppress-warnings" }
end