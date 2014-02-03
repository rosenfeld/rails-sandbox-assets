namespace :sandbox_assets do
  desc "Run Sandboxed Assets server"
  task :serve => :environment do
    Rails.application.tap do |app|
      app.routes.draw { mount SandboxAssets::Engine => '/' }
      port = app.config.sandbox_assets.port

      puts "Your assets will be soon available at http://localhost:#{port}\n\n"
      Rack::Server.start app: app, Port: port
    end
  end
end
