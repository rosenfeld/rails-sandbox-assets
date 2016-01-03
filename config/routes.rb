SandboxAssets::Engine.routes.draw do
  # When the application is booted by sidekiq (tested with 4.0.1) Rails.application.assets may not
  # be loaded
  mount Rails.application.assets => Rails.configuration.assets.prefix if Rails.application.assets
  get '_iframe/*path' => 'sandbox_assets/test_runner#iframe', format: false,
    as: :sandbox_assets_iframe
  ['', '*path'].each do |p|
    get p => 'sandbox_assets/test_runner#index', format: false
  end
end
