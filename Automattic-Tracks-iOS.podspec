Pod::Spec.new do |spec|
  spec.name         = 'Automattic-Tracks-iOS'
  spec.version      = '0.0.0'
  spec.license      = { :type => 'GPLv2' }
  spec.homepage     = 'https://github.com/automattic/automattic-tracks-ios'
  spec.authors      = { 'Aaron Douglas' => 'aaron@automattic.com' }
  spec.summary      = 'Simple way to track events in an iOS app with Automattic Tracks internal service'
  spec.source       = { :git => 'https://github.com/Automattic/Automattic-Tracks-iOS.git', :tag => spec.version.to_s }
  spec.source_files = 'Automattic-Tracks-iOS/**/*.{h,m}'
  spec.framework    = 'CoreData'
end