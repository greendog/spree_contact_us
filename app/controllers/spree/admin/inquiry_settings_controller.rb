module Spree
  module Admin
    class InquirySettingsController < Spree::Admin::BaseController
      def update
        # workaround for unset checkbox behaviour
        params[:captcha] ||= {}
        params[:captcha][:use_captcha] = !params[:captcha][:use_captcha].blank?
        Spree::ContactUsConfiguration.set(params[:captcha])

        respond_to do |format|
          format.html { redirect_to admin_inquiry_settings_path }
        end
      end
    end
  end
end