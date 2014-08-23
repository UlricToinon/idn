module Idn
  module Api

    module QueryHelper
      def simple_query(path, options={})

        headers = options.delete(:headers) || {}
        params  = to_query(options)
        path   += "#{path.include?("?") ? "&" : "?"}#{params}" if !params.empty?

        Mash.from_json(get(path, headers))
      end
    end
  end
end