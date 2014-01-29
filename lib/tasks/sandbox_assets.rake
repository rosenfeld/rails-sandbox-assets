namespace :sandbox_assets do
  desc "Run Sandboxed Assets server"
  task :serve => :environment do
    app = SandboxAssets::Engine
    port = app.config.sandbox_assets.port
    app.routes.define_mounted_helper 'sandbox_assets_engine'

    puts "Your assets will be soon available at http://localhost:#{port}\n\n"
    Rack::Server.start app: app, Port: port
  end
end
