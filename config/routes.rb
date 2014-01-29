SandboxAssets::Engine.routes.draw do
  mount Rails.application.assets => Rails.configuration.assets.prefix
  get '_iframe/*path' => 'sandbox_assets/test_runner#iframe', format: false,
    as: :sandbox_assets_iframe
  ['', '*path'].each do |p|
    get p => 'sandbox_assets/test_runner#index', format: false
  end
end
