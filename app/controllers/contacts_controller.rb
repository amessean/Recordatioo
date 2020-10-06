class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def contact_callback
    @contacts = request.env['omnicontacts.contacts']
    @user = request.env['omnicontacts.user']
    @contacts.each do |contact|
    contact1 = current_user.contacts.new
    contact1.name = contact[:name]
    contact1.email = contact[:email]
    contact1.phone_number = contact[:phone_number]
    contact1.save(:validate => false)
  end
  redirect_to "/contacts"
  end

  def index
    @contacts = Contact.all.where(user: current_user)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
      if @contact.save
        redirect_to contacts_path
      else
        render :new
      end
  end

  def edit
  end

  def update
    @contact.update(contact_params)
    redirect_to contact_path(@contact)
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end

private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def booking_params
    params.require(:contact).permit(:name, :email, :phone_number, :user_id, :picture)
  end


end
