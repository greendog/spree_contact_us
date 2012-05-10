module Spree
  class InquiriesController < Spree::BaseController
    helper 'spree/admin/base'

    def new
      @inquiry = Inquiry.new
    end

    def create
      @inquiry = Inquiry.new(params[:inquiry])
      if validate_captcha && @inquiry.save
        redirect_to :back, :notice => t(:on_send_message)
      else
        render :action => 'new'
      end
    end

    def index
      redirect_to(new_inquiry_url) unless params[:inquiry]
    end

    protected

    def validate_captcha
      if use_captcha
        verify_recaptcha(
          :model => @inquiry,
          :message => t(:recaptcha_error_mes),
          :private_key => recaptcha_key
        )
      else
        true
      end
    end

    def recaptcha_key
      Spree::ContactUsConfiguration[:recaptcha_private_key]
    end

    def use_captcha
      Spree::ContactUsConfiguration[:use_captcha] == true
    end
  end
end