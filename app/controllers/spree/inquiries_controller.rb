class Spree::InquiriesController < Spree::BaseController
  helper 'spree/admin/base'

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])

    skip_captcha || verify_recaptcha(:model => @inquiry, :message => t(:recaptcha_error_mes), :private_key => recaptcha_public_key)

    if @inquiry.errors.empty? && @inquiry.save
      redirect_to @inquiry, :notice => t(:flash_inquiry_sent_succesfully)
    else
      render :action => 'new'
    end
  end

  def index
    redirect_to(new_inquiry_url) unless params[:inquiry]
  end
  
  protected

  def recaptcha_public_key
    SpreeContactUs::Config[:recaptcha_public_key]
  end

  def skip_captcha
    SpreeContactUs::Config[:use_captcha] == false || !defined?(Recaptcha)
  end
  
  def accurate_title
    I18n.t 'contact_us'
  end

end
