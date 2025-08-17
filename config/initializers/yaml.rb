# Enable YAML aliases for Ruby 3.1 compatibility
module Psych
  class << self
    alias_method :original_load_file, :load_file
    
    def load_file(filename, **kwargs)
      original_load_file(filename, aliases: true, **kwargs)
    end
  end
end