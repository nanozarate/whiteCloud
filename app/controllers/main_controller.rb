class MainController < ActionController::Base
  def index
    @contact = Contact.new(:id => 1)
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to("/", :notice => "Contact was successfully sent.")
    else
      flash[:alert] = "You must fill all fields."
      render 'index'
    end
  end
end
