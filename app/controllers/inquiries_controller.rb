class InquiriesController < Spree::BaseController
  helper 'spree/base'
  include SimpleCaptcha::ControllerHelpers

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])

    respond_to do |format|
      if simple_captcha_valid?
        if @inquiry.valid? && @inquiry.save
          format.html do
            flash[:notice] = t(:on_send_message)
            redirect_to(@inquiry)
          end
        else
          format.html { render :action => "new" }
        end
      else
        format.html do
          flash[:notice] = t(:recaptcha_error_mes)
          render :action => "new"
        end
      end
    end
  end

  #create.flash I18n.t(:on_send_message)

  def index
    redirect_to(new_inquiry_url) unless params[:inquiry]
  end

end
