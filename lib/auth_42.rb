if defined? Rails
    require 'auth_42/railtie'
else
    require 'auth_42/simple_auth'
end
