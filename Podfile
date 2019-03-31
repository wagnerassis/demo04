source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

def ui_pods
  pod 'SnapKit'
  pod 'OCMixins'
  pod 'PKHUD'
  pod 'IQKeyboardManagerSwift'
  pod 'TableManager'
  pod 'Kingfisher'
  pod 'Alamofire', '~> 4.8.2'
end

def test_pods
  pod 'Quick'
  pod 'Nimble'
end

target 'Demo4all' do
  ui_pods
  
end

target 'Demo4allTests' do
  test_pods
end

post_install do |installer_representation|
  installer_representation.pods_project.targets.each do |target|
    
    if target.name == 'OCMixins'
      target.build_configurations.each do |config|
        config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'YES'
        config.build_settings['SWIFT_VERSION'] = '4.2.1'
      end
      else
      target.build_configurations.each do |config|
        config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
        config.build_settings['SWIFT_VERSION'] = '4.2'
      end
    end
  end
end
