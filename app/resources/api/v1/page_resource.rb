module Api
  module V1
    class PageResource < JSONAPI::Resource
      attributes :content
      has_one :book
    end    
  end 
end