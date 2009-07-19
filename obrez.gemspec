Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name = 'obrez'
  s.version = '0.1'
  s.date = '2009-07-19'

  s.description = "No fork? Try obrez."
  s.summary     = s.description

  s.authors = ["Ed Sinjiashvili"]
  s.email = "mediogre@gmail.com"

  s.files = %w[
    README
    LICENSE
    obrez.gemspec
    lib/obrez.rb
    bin/obrez
    bin/obrez_cli
  ]
  s.executables = ['obrez', 'obrez_cli']

  s.add_dependency 'rack',    '>= 1.0.0'
  s.homepage = "http://github.com/mediogre/obrez/"
  s.require_paths = %w[lib]
end
