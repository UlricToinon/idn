module Idn
  module Api

    module User

      def me(options={})
        path = "/anywhere/v2/me"
        simple_query(path, options)
      end

      def logout(options={})
        path = 'anywhere/v2/account/logout'
        simple_query(path, options)
      end

      def badge(options={})
        path = 'anywhere/v2/status/badge'
        simple_query(path, options)
      end
    end
  end
end