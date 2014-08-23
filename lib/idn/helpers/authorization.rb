module Idn
  module Helpers

    # Use OAuth protocol
    module Authorization

      OAUTH_PARAMS={
        :authorization_code_path  => 'Anywhere/oauth/v2/authorize',
        :access_token_path        => '/oauth/v2',
        :auth_host                => 'https://www.idn.laposte.fr'
      }

      def client
        @client ||= ::OAuth2::Client.new(@client_token, @client_secret, parse_oauth_options)
      end

      def authorize_request(options={})
        @authorization_code ||= client.auth_code.authorize_url(options)
      end

      def access_token_request(authorization_code, options={})
        @access_token ||= client.auth_code.get_token(authorization_code, options)
      end

      private

        def parse_oauth_options
          {
            :access_token_url => compute_oauth_url(:access_token, :auth_host),
            :authorize_url    => compute_oauth_url(:authorization_code, :auth_host),
            :site             => @client_options[:site] || OAUTH_PARAMS[:auth_host]
          }
        end

        def compute_oauth_url(path_type, host)
          if @consumer_options["#{path_type}_url".to_sym]
            @consumer_options["#{path_type}_url".to_sym]
          else
            host = @consumer_options[:site] || OAUTH_PARAMS[host]
            path = @consumer_options[:"#{path_type}_path".to_sym] || OAUTH_PARAMS["#{path_type}_path".to_sym]
            "#{host}#{path}"
          end
        end
    end
  end
end