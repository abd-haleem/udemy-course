require "yaml"

YAML.load_file = ->(filename, **options) do
  Psych.load(File.read(filename), aliases: true, **options)
end