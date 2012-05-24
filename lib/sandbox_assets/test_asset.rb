module SandboxAssets
  class TestAsset
    class << self
      def find_tests(params)
        return all unless path = params[:path]
        all.find_all {|fn| fn.start_with? path }
      end

      def all
        config = Engine.config.sandbox_assets
        files = []
        config.tests_roots.each do |root|
          config.tests_patterns.each do |pattern|
            test_dir = Rails.root.join root
            files.concat Dir[test_dir.join pattern].sort.map { |fn|
              fn.sub(test_dir.to_s, '').sub(/(\.js|\.coffee).*/, '')[1..-1]
            }
          end
        end
        files
      end
    end
  end
end
