Pod::Spec.new do |spec|
    spec.name         = "Noibu"
    spec.version      = "0.1.3"  
    spec.summary      = "Noibu iOS SDK"
    spec.description  = "Noibu iOS SDK for monitoring and improving digital experience."
    
    spec.homepage     = "https://github.com/jayvennoibu/noibu-react-native"
    spec.license      = { :type => "MIT", :file => "LICENSE" }
    spec.author       = { "Jayven Nhan" => "jayven.nhan@noibu.com" }
    
    spec.platform     = :ios
    spec.ios.deployment_target = "13.0"
    
    spec.source       = { 
      :git => "https://github.com/jayvennoibu/noibu-react-native.git",
      :tag => "v#{spec.version}" 
    }
    
    spec.vendored_frameworks = "Noibu.xcframework"
    
    spec.static_framework = true
    spec.pod_target_xcconfig = { 
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
      'VALID_ARCHS' => 'arm64 x86_64'
    }
    spec.user_target_xcconfig = { 
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
    }
  end