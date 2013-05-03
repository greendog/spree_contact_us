module Spree
  module Admin
    class InquirySettingsController < Spree::Admin::BaseController
      def update
        # workaround for unset checkbox behaviour
        params[:captcha] ||= {}
        params[:captcha][:use_captcha] = !params[:captcha][:use_captcha].blank?
        Spree::ContactUsConfiguration.set(params[:captcha])
        # Set inquiry types
        params[:inquiry_types] = params[:inquiry_types].split(/,\s*/).map(&:to_sym)
        Spree::ContactUsConfiguration.set(:inquiry_types => params[:inquiry_types])

        respond_to do |format|
          format.html { redirect_to admin_inquiry_settings_path }
        end
      end
    end
  end
end
