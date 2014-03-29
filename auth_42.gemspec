Gem::Specification.new do |s|
  s.name                        = 'Auth42'
  s.version                     = '1.0.0'
  s.licenses                    = ['Apache2']
  s.summary                     = "Authenticate 42'school users"
  s.description                 = "A simple ruby Gem to authenticate 42'school users"
  s.author                      = 'André Aubin'
  s.email                       = 'andre.aubin@lambdaweb.fr'
  s.files                       = ["lib/auth_42.rb", "lib/auth_42/railtie.rb", "lib/auth_42/simple_auth.rb"]
  s.require_paths               = ["lib"]
  s.extra_rdoc_files            = ['README.md']
  s.homepage                    = 'https://github.com/WeAreMuffin/Auth42-ruby'
  s.metadata                    = {
    "issue_tracker" => "https://github.com/WeAreMuffin/Auth42-ruby/issues",
    "physical_requirements" => "Have an access on the 42 LDAP",
  }
  s.add_runtime_dependency "net-ldap", ["~> 0.5"]
end
