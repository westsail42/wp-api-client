module WpApiClient
  module Entities
    class PostType < Base
      alias :post_type

      def self.represents?(json)
        json.key?("hierarchical") and json.key?("name") and json.key?("slug")
      end

      def initialize(json)
        raise WpApiClient::ErrorResponse.new(json)
      end
    end
  end
end
