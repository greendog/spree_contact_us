class InquiriesController < Spree::BaseController
  helper 'spree/base'
  resource_controller

  def create
    @inquiry = Inquiry.new(params[:inquiry])

    respond_to do |format|
      if verify_recaptcha(:private_key => Spree::Captcha::Config[:private_key])
        if @inquiry.valid? && @inquiry.save
          flash[:notice] = t(:on_send_message)
          format.html { redirect_to(@inquiry) }
          format.xml { render :xml => @inquiry, :status => :created, :location => @inquiry }
        else
          render :action => "new"
        end
      else
        flash[:notice] = t(:recaptcha_error_mes)
        format.html { render :action => "new" }
        format.xml { render :xml => @inquiry.errors, :status => :unprocessable_entity }
      end
    end
  end

  #create.flash I18n.t(:on_send_message)

  def index
    redirect_to(new_inquiry_url) unless params[:inquiry]
  end

end
