module Spree
  module Admin
    class InquiriesController < Spree::Admin::ResourceController

      respond_to :html, :json

      def model_class
        "Spree::Inquiry".constantize
      end

      def index
        @search = Spree::Inquiry.search params[:q]
        @collection = @search.result.order('spree_inquiries.created_at DESC').page params[:page]
        respond_with @collection
      end

    end
  end
end
