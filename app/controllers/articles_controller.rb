class ArticlesController < ApplicationController

    def index
        @articles = client.entries(content_type: :article)
    end

    def show
        @article = client.entries(content_type: :article, 'fields.slug': params[:id]).first
    end
 
    def client
        return Contentful::Client.new(
                access_token: '449b732b878ecdb8e0f9214917fa9dea3ed6b3c1e93555f70ac0f69f701960e0', 
                space: 'bmikc0bj3q8a'
            ) 
        
    end
end
