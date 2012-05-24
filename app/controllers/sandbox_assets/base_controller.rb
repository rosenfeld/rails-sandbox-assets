require "sandbox_assets/test_asset"

module SandboxAssets
  class BaseController < ActionController::Base
    def index
      @tests = TestAsset.find_tests(params)
    end
  end
end

