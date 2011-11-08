class Admin::InquiriesController < Admin::ResourceController

  def collection
    return @collection if @collection.present?
    unless request.xhr?
      params[:search] ||= {}
      params[:search][:meta_sort] ||= "name.asc"
      @search = super.metasearch(params[:search])
      @collection = @search.relation.page(params[:page]).per(Spree::Config[:per_page])
    else
      @collection = Inquiry.find(:all, :limit => (params[:limit] || 100))
    end
  end
  
end
