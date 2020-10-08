class ContactsController < ApplicationController


  def index_callback
    @contacts = request.env['omnicontacts.contacts']
    @user = request.env['omnicontacts.user']
    respond_to do |format|
      format.html
    end
  end

end
