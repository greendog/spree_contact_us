class InquiriesController < Spree::BaseController
  helper 'spree/base'
  resource_controller  
  
  def create
    @inquiry = Inquiry.new(params[:inquiry])

    respond_to do |format|
        if verify_recaptcha(:private_key => Spree::Captcha::Config[:private_key])
      @inquiry.save
        flash[:notice] = 'Your inquiry was successfully created.'
        format.html { redirect_to(@inquiry) }
        format.xml  { render :xml => @inquiry, :status => :created, :location => @inquiry }
      else
        flash[:notice] = 'There was an error with the ReCAPTCHA, please try again.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @inquiry.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  create.flash I18n.t(:on_send_message)

  def index
    redirect_to(new_inquiry_url) unless params[:inquiry]
  end

end
