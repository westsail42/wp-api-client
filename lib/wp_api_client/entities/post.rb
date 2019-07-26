module WpApiClient
  module Entities
    class Post < Base
      alias :post :resource

      def self.represents?(json)
        json.dig("_links", "about") and json["_links"]["about"].first["href"] =~ /wp\/v2\/types/
      end

      def post_id
        post["id"]
      end

      def post_type
        post["type"]
      end

      def title
        post["title"]["rendered"]
      end

      def date
        Time.parse(post["date_gmt"]) if post["date_gmt"]
      end

      def content
        post["content"]["rendered"]
      end

      def excerpt
        post["excerpt"]["rendered"]
      end

      def terms(taxonomy = nil)
        relations("https://api.w.org/term", taxonomy)
      end

      def author
        relations("author")
      end

      def geo_lat
        post['geo_location'].try(:[], 'lat')
      end

      def geo_lng
        post['geo_location'].try(:[], 'lng')
      end

      def geo_address
        post['geo_location'].try(:[], 'address')
      end

      def meta(key = nil)
        @meta ||= relations("https://api.w.org/meta")

        if key
          @meta[key.to_s]
        else
          @meta
        end
      end
    end
  end
end
