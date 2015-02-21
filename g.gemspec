Gem::Specification.new do |s|
  s.name = 'g_'
  s.version = '1.0'
  s.summary = "Git workflow tool"
  s.description = "The purpose of this Ruby gem is provide automated features for git workflows."
  s.authors = ["Giovanny Andres Gongora Granada"]
  s.licenses = ['MIT']
  s.email = "gioyik@gmail.com"
  s.homepage = "http://github.com/Gioyik/g_/"

  s.files = %w[
    README.md
    g.gemspec
    bin/g_
    lib/g.rb
  ]

  s.executables = ['g_']
  s.extra_rdoc_files = %w[README.md]
  s.require_paths = %w[lib]
end
