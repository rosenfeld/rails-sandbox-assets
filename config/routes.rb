SandboxAssets::Engine.routes.draw do
  mount Rails.application.assets => Rails.configuration.assets.prefix
  ['/', '*path'].each do |p|
    get p => 'sandbox_assets/test_runner#index', format: false
  end
end
