Gem::Specification.new do |s|
  s.name        = 'ruby-lazy-const'
  s.version     = '0.0.1'
  s.summary     = 'ruby consts load lazily with const_missing; const namespace match directory structure.'
  s.description = 'Lazily Load Consts'
  s.authors     = ['James Carson']
  s.email       = 'jms.crsn@gmail.com'
  s.homepage    = "http://tmpurl.com"
  s.files       = ['lib/ruby-lazy-const.rb']
  s.license     = 'MIT'
  s.add_runtime_dependency 'activesupport'
end
