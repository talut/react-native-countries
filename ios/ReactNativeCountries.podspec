
Pod::Spec.new do |s|
  s.name         = "ReactNativeCountries"
  s.version      = "1.0"
  s.summary      = "ReactNativeCountries"
  s.description  = <<-DESC
                  ReactNativeCountries
                   DESC
  s.homepage     = "https://github.com/talut/react-native-countries"
  s.license      = "MIT"
  s.author       = { "author" => "iletisim@taluttasgiran.com.tr" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/talut/react-native-countries.git", :tag => "master" }
  s.source_files = "ReactNativeCountries/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"

end

  