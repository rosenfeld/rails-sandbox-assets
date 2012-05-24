require 'sandbox_assets/settings'

module SandboxAssets
  class Engine < Rails::Engine
    config.autoload_paths << File.expand_path("../lib/", __FILE__)
    config.sandbox_assets = Settings.new

    initializer "sandbox_assets" do |app|
      config = app.config.sandbox_assets
      app.config.assets.paths.concat config.assets_paths
    end
  end
end
