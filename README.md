# Rails::Sandbox::Assets

Customize your test runner while taking advantage of the Rails asset pipeline.

## Installation

Add this line to your application's Gemfile:

    gem 'rails-sandbox-assets'

Or if you prefer to use the master branch:

    gem 'rails-sandbox-assets', git: 'git://github.com/rosenfeld/rails-sandbox-assets' # or:
    gem 'rails-sandbox-assets', github: 'rosenfeld/rails-sandbox-assets' # Bundler-pre syntax

And then execute:

    $ bundle

## Usage

Place your tests under _test/javascripts/\*\_test.js_ or _spec/javascripts/\*\_spec.js.coffee_.
Use JavaScript or CoffeeScript.

You can add your test assets to _test/assets/javascripts_, _test/assets/stylesheets_,.
_spec/assets/javascripts_ and _spec/assets/stylesheets_.

    $ rake sandbox_assets:serve

Follow the instructions in http://localhost:5000 for how to override the void bundled test-runner.

You can run a subset of your tests by specifying a path like _http://localhost:5000/products_.

This will only run your tests which path starts with _test/javascripts/products_, for example.

## Settings

You can change your settings directly from config/application.rb, if you want to:

    config.sandbox_assets.template = 'spec_runner/runner'

By default this setting is nil, which will follow the Rails convention and use
_app/views/sandbox_assets/test_runner/index.html.erb_. You could actually use HAML if you prefer.

Just create such file in your application to override the default one. With the option in the
example above, you should create your view in _app/views/spec_runner/runner.html.erb_.

Or you can create a separate initializer if you prefer:

    # config/initializers/setup_sandbox_assets.rb
    SandboxAssets::Engine.config.sandbox_assets.tap do |c|
      c.template = 'test_runner/index' # set the runner template path
      c.disable_template_param = true
    end

Default settings:

    c.port = 5000
    # By default, sandbox_assets will look for your tests in test/javascripts and spec/javascripts
    c.tests_roots = %w(test/javascripts spec/javascripts)
    # Add to Rails assets path. Besides your tests/spec, any assets in those paths will be served
    # by the asset pipeline:
    c.assets_paths = c.tests_roots +
        %w(test/assets/javascripts  test/assets/stylesheets
          spec/assets/javascripts spec/assets/stylesheets)
    # Pattern to find your tests or spec inside the tests_roots directories:
    c.tests_patterns = %w(**/*_{test,spec}.{js,coffee}*)
    # By default, you can override which template to use in the params, like:
    # http://localhost:5000/?template=spec_runner/runner
    c.disable_template_param = false

## Gems using Rails Sandbox Assets

- [rails\_sandbox\_jasmine](http://github.com/rosenfeld/rails_sandbox_jasmine)
- [rails\_sandbox\_mocha\_chai](http://github.com/rosenfeld/rails_sandbox_mocha_chai)

## Examples

Here are some more examples on how you can use this gem:

Creating new engines depending on this one:

- [konacha\_like](https://github.com/rosenfeld/konacha_like)
- [konacha\_reuse](https://github.com/rosenfeld/konacha_reuse)

Creating application depending direcly on this gem:

- [mixed\_test\_runners](https://github.com/rosenfeld/mixed_test_runners)

The above application shows how to set-up a mixed environment with specs written both in Jasmine and
Mocha/Chai, using different spec runners, of course. Also it demonstrates how to set up your custom
spec runner.

In this case it is a simple HTML pointing to the paths for each supported spec runner, but you can use
the _@tests_ and _@stylesheets_ instance variables to include them anywhere in your custom template file.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/rosenfeld/rails-sandbox-assets/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

