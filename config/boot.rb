ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.

# Enable YAML aliases for Ruby 3.1 compatibility
require 'psych'
module Psych
  class << self
    alias_method :original_load_file, :load_file
    
    def load_file(filename, **kwargs)
      kwargs[:aliases] = true unless kwargs.key?(:aliases)
      original_load_file(filename, **kwargs)
    end
  end
end
