Gem::Specification.new do |s|
  s.name        = 'check_the_facts'
  s.version     = '0.0.0'
  s.date        = '2016-09-30'
  s.summary     = "Check the Facts"
  s.description = "A Snopes Scraper and CLI"
  s.authors     = ["David Kennell"]
  s.email       = 'davidkennell0@gmail.com'
  s.files       = Dir['Gemfile', 'Gemfile.lock', 'Notes', 'environment.rb', 'check_the_facts.gemspec', '{bin,lib,config}/**/*'] & `git ls-files -z`.split("\0")
  s.executables = ["check_the_facts"]
  s.homepage    = 'http://rubygems.org/gems/check_the_facts'
  s.license       = 'MIT'
end