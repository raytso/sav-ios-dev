# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

abstract_target 'Hogshead' do
  use_frameworks!
  inhibit_all_warnings!

  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'
  pod 'RxDataSources', '~> 3.0'
  pod 'Swinject'
  pod 'SwinjectStoryboard'

  target 'SAV' do
  end

  target 'SAVTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SAVUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end