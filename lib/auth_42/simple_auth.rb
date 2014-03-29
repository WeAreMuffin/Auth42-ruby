module Auth42
    require 'net/ldap'

    class SimpleAuth
        S_URL = "ldap.42.fr"
        S_PORT = 636
        S_ENCRYPTION = {:method => :simple_tls}
        S_BASE = "ou=2013,ou=people,dc=42,dc=fr"


        # constructor method
        def initialize
            @handler = self.getHandler
        end

        def handler
            @handler
        end

        def self.authenticate(user, password)
            c = Net::LDAP.new(
                        :host => S_URL,
                        :port => S_PORT,
                        :base => S_BASE,
                        :encryption => S_ENCRYPTION,
                        :username => user,
                        :password => password
                    )
            if c.bind
              return true
            else
              return false
            end
        end

        def search(query: "", filter: "", login: "", password: "")
            if !login.empty? and !password.empty?
                @handler = self.getAuthHandler(login, password)
            end
            if self.connect
                q = {}
                q[:filter] = filter unless filter.empty?
                q[:attributes] = query unless query.empty?
                results = @handler.search(q)
            end
        end

        protected

            def getHandler
                c = Net::LDAP.new(
                        :host => S_URL,
                        :port => S_PORT,
                        :base => S_BASE,
                        :encryption => S_ENCRYPTION
                    )
                c
            end

            def getAuthHandler(user, password)
                c = Net::LDAP.new(
                        :host => S_URL,
                        :port => S_PORT,
                        :base => S_BASE,
                        :encryption => S_ENCRYPTION,
                        :username => user,
                        :password => password
                    )
                c
            end

            def connect
                @connected = @handler.bind
            end
    end

end
