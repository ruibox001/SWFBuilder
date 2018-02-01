Pod::Spec.new do |s|
s.name        = 'SWFBuilder'
s.version     = '1.0.0'
s.authors     = { 'ruibox001' => 'wangshengyuancrazy@163.com' }
s.homepage    = 'https://github.com/ruibox001/SWFBuilder'
s.summary     = 'SWFBuilder 快速编程组件'
s.source      = { :git => 'https://github.com/ruibox001/SWFBuilder.git',:tag => "v#{s.version}" }
s.license     = { :type => "MIT", :file => "LICENSE" }
s.platform = :ios, '11.0'
s.requires_arc = true
s.source_files  = "SWFBuilder/*.swift"
s.framework  = "UIKit","Foundation"
s.ios.deployment_target = '11.0'

s.pod_target_xcconfig = { "OTHER_SWIFT_FLAGS[config=Release]" => "-suppress-warnings" }
end