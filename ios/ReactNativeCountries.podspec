
Pod::Spec.new do |s|
  s.name         = "ReactNativeCountries"
  s.version      = "0.0.13"
  s.summary      = "ReactNativeCountries"
  s.description  = <<-DESC
                  ReactNativeCountries
                   DESC
  s.homepage     = "https://github.com/talut/react-native-countries"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "info@taluttasgiran.com.tr" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/talut/react-native-countries.git", :tag => "master" }
  s.source_files  = "ReactNativeCountries/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  