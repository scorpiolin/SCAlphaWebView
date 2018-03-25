Pod::Spec.new do |s|
  s.name             = 'SCAlphaWebView'
  s.version          = '0.1.0'
  s.summary          = 'a kind of webview with transparent background.'
 
  s.description      = <<-DESC
A fantastical dynamic way for your app, just have a try!                       
                       DESC
 
  s.homepage         = 'https://github.com/scorpiolin/SCAlphaWebView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'scorpiolin' => 'linqin18@gmail.com' }
  s.source           = { :git => 'https://github.com/scorpiolin/SCAlphaWebView.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'SCAlphaWebView/Classes/SCAlphaWebView.swift'
 
end