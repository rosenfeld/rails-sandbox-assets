require "sandbox_assets/test_asset"

module SandboxAssets
  class BaseController < ActionController::Base
    before_filter :find_tests
    before_filter :find_stylesheets
    before_filter :extract_template_from_params
    before_filter :render_template

    # additional before_filters can use this
    def template=(template)
      @template = template
    end

    protected

    def find_tests
      @tests = TestAsset.find_tests(params)
    end

    def find_stylesheets
      @stylesheets = TestAsset.find_stylesheets(params)
    end

    def extract_template_from_params
      @template ||= params[:template] unless cfg.disable_template_param
    end

    def render_template
      render @template if template
    end

    def template
      @template ||= cfg.template
    end

    def cfg
      @cfg ||= Engine.config.sandbox_assets
    end
  end
end

