Gem::Specification.new do |s|
  s.name        = 'drizzt'
  s.version     = '1.0.0'
  s.summary     = 'Pathfinding tool.'
  s.description = 'Provides various pathfinding tools for graphs (and in the future hex maps).'
  s.authors     = ['Cédric Zuger']
  s.email       = 'zuger.cedric@gmail.com'

  s.files       = Dir['{lib}/**/*.rb', 'LICENSE', '*.md']

  s.homepage    = 'https://github.com/czuger/drizzt'
  s.license       = 'MIT'

  s.add_dependency 'algorithms', '~> 1.0'

end