module Idn
  module Helpers

    module Request

      DEFAULT_HEADERS = {
        'x-li-format' => 'json'
      }

      def get(path, options={})
        response = access_token_request.get(path, DEFAULT_HEADERS.merge(options))
        response.body
      end

      def post(path, options={})
        access_token_request.post(path, DEFAULT_HEADERS.merge(options))
      end

      private 

        def to_query(params)
          params.map { |k, v|
            if v.class == Array
              to_query(v.map { |x| [k, x] })
            else
              v.nil? ? escape(k) : "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}"
            end
          }.join("&")
        end
    end
  end
end