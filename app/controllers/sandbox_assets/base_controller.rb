require_dependency "sandbox_assets/test_asset"

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
      @iframe_template ||= params[:iframe_template] unless cfg.disable_template_param
    end

    def render_template
      (render_iframe_template; return) if params[:action] == 'iframe'
      render @template if template
    end

    def render_iframe_template
      render @iframe_template if iframe_template
    end

    def template
      @template ||= cfg.template
    end

    def iframe_template
      @iframe_template ||= cfg.iframe_template
    end

    def cfg
      @cfg ||= Engine.config.sandbox_assets
    end
  end
end

