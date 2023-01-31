class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

def new
  @contact = Contact.new
  authorize @contact
end

def create
  @contact = Contact.new(params[:contact])
  @contact.request = request
  authorize @contact
  if @contact.deliver
    flash.now[:error] = nil
    redirect_to root_path, notice: 'Message sent successfully'
  else
    flash.now[:error] = 'Cannot send message'
    render :new
  end
end

def contact_params
  params.require(:post).permit(:title_ca, :author, :content, :photo, :category_id)
end
end
