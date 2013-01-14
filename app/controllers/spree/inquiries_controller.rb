module Spree
  class InquiriesController < Spree::BaseController
    helper 'spree/admin/base'

    def new
      @inquiry = Inquiry.new
    end

    def create
      @inquiry = Inquiry.new(params[:inquiry])

      if validate_captcha && @inquiry.save
        redirect_to contact_path, :notice => t(:on_send_message)
      else
        render :new
      end
    end

    def index
      redirect_to(contact_path) unless params[:inquiry]
    end

    protected

    def validate_captcha
      !has_invalid_captcha?
    end

    def has_invalid_captcha?
      if use_recaptcha?
        response = verify_recaptcha(recaptcha_params)

        # the recaptcha plugin inserts this flash message every time regardless of success/failure
        # spree_contact_us provides error + success notifications, it is safe to delete this
        flash.delete(:recaptcha_error)

        !response
      elsif Spree::ContactUsConfiguration[:use_honeypot]
        unless params[:honey].blank?
          flash[:captcha_error] = t(:recaptcha_error_mes)
        end
      end
    end

    def use_recaptcha?
      Spree::ContactUsConfiguration[:use_captcha] && Spree::ContactUsConfiguration[:recaptcha_private_key].present?
    end

    def recaptcha_params
        {
          :model => @inquiry,
          :message => t(:recaptcha_error_mes),
          :private_key => Spree::ContactUsConfiguration[:recaptcha_private_key]
        }
    end

  end
end
