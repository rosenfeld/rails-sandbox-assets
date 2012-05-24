module SandboxAssets
  class Settings
    attr_reader :options
    attr_accessor :tests_roots, :assets_paths, :port,
      :tests_patterns, :stylesheets_patterns,
      :template, :disable_template_param

    def initialize
      @tests_roots = %w(test/javascripts spec/javascripts)
      @assets_paths = @tests_roots +
        %w(test/assets/javascripts  test/assets/stylesheets
          spec/assets/javascripts spec/assets/stylesheets)
      @tests_patterns = %w(**/*_{test,spec}.{js,coffee}*)
      @stylesheets_patterns = %w(**/*_{test,spec}.{css,scss,sass,less}*)
      @port = 5000
      @disable_template_param = false
      @options = {}
    end
  end
end
