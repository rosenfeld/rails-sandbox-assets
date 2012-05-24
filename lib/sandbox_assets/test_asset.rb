module SandboxAssets
  class TestAsset
    class << self
      def find_tests(params)
        find params, all(config.tests_patterns, /(\.js|\.coffee).*/)
      end

      def find_stylesheets(params)
        find params, all(config.stylesheets_patterns, /(\.css|\.scss|\.sass|\.less).*/)
      end

      protected

      def find(params, file_list)
        return file_list unless path = params[:path]
        file_list.find_all {|fn| fn.start_with? path }
      end

      def all(patterns, remove_regexp)
        files = []
        config.tests_roots.each do |root|
          patterns.each do |pattern|
            test_dir = Rails.root.join root
            files.concat Dir[test_dir.join pattern].sort.map { |fn|
              fn.sub(test_dir.to_s, '').sub(remove_regexp, '')[1..-1]
            }
          end
        end
        files
      end

      def config
        @@config ||= Engine.config.sandbox_assets
      end
    end
  end
end
