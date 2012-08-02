module Spree
  module Admin
    class InquiriesController < Spree::Admin::ResourceController
      def model_class
        "Spree::Inquiry".constantize
      end

      def collection
        return @collection if @collection.present?
        unless request.xhr?
          params[:search] ||= {}
          params[:search][:meta_sort] ||= "name.asc"
          @search = super.search(params[:search])
          @collection = @search.result.page(params[:page]).per(10)
        else
          @collection = Inquiry.find(:all, :limit => (params[:limit] || 100))
        end
      end
    end
  end
end