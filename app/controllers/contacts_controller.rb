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
  params.require(:post).permit(:title, :author, :content, :photo, :category_id)
end
end


class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  def new
    @contact = Contact.new
    authorize @contact
  end
  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    if @contact.deliver
      flash.now[:notice] = 'Gràcies pel teu missatge. Et contestarem aviat!'
    else
      flash.now[:error] = 'El missatge no s\'ha pogut enviar.'
      render :new
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
