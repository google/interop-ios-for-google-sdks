Pod::Spec.new do |s|
  s.name             = 'RecaptchaInterop'
  s.version          = '100.0.0'
  s.summary          = 'Interfaces that allow Firebase SDKs to use RecaptchaEnterprise functionality.'

  s.description      = <<-DESC
  Not for public use.
  A set of protocols that Firebase SDKs can use to interoperate with RecaptchaEnterprise in a safe
  and reliable manner.
                       DESC

  s.homepage         = 'https://cloud.google.com/recaptcha-enterprise'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.authors          = 'Google, Inc.'

  s.source           = {
    :git => 'https://github.com/google/interop-ios-for-google-sdks.git',
    :tag => 'CocoaPods-' + s.version.to_s
  }
  s.ios.deployment_target = '11.0'

  base_dir = "RecaptchaEnterprise/RecaptchaInterop/"

  s.source_files = base_dir + '**/*.[hm]'
  s.public_header_files = base_dir + 'Public/RecaptchaInterop/*.h'
end
