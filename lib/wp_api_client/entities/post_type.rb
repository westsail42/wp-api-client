module WpApiClient
  module Entities
    class PostType < Base
      # alias :resource

      def self.represents?(json)
        json.key?("hierarchical") and json.key?("name") and json.key?("slug")
      end

    end
  end
end
