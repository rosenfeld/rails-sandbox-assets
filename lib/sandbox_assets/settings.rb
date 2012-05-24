module SandboxAssets
  class Settings
    attr_reader :options
    attr_accessor :tests_roots, :assets_paths, :tests_patterns, :port

    def initialize
      @tests_roots = %w(test/javascripts specs/javascripts)
      @assets_paths = @tests_roots + 
        %w(test/assets/javascripts test/assets/stylesheets)
      @tests_patterns = %w(**/*_{test,spec}.{js,coffee}*)
      @port = 5000
      @options = {}
    end
  end
end
