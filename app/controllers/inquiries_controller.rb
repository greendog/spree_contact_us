class InquiriesController < Spree::BaseController
  helper 'spree/base'
  include SimpleCaptcha::ControllerHelpers

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])

    respond_to do |format|
      if simple_captcha_valid? || Spree::Captcha::Config[:use_captcha] == false
        if @inquiry.valid? && @inquiry.save
          format.html { inquiry_saved }
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

  def index
    redirect_to(new_inquiry_url) unless params[:inquiry]
  end
  
  protected
  
  def inquiry_saved
    flash[:notice] = t(:inquiry_sent_succesfully)
    redirect_to(@inquiry)
  end
  
  def accurate_title
    I18n.t 'contact_us'
  end

end
