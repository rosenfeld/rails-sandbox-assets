require 'sandbox_assets/settings'

module SandboxAssets
  class Engine < Rails::Engine
    config.autoload_paths << File.expand_path("../lib/", __FILE__)
    config.sandbox_assets = Settings.new

    initializer "sandbox_assets" do |app|
      config = app.config.sandbox_assets
      app.config.assets.paths.concat config.assets_paths
    end

    config.after_initialize do
      ActiveSupport.on_load(:action_view) do
        default_checker = ActionView::Base.precompiled_asset_checker
        ActionView::Base.precompiled_asset_checker = -> logical_path do
          default_checker[logical_path] || Thread.current[:skip_precompiled_check]
        end
      end
    end
  end
end
