class ContactsController < ApplicationController
    def new
        @contact = Contact.new 
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params [:concact][:comments]
            
            ContactMailer.contact_email(name, email, body)
            flash[:succes] = "Well done! Message sent."
            redirect_to new_contact_path
        else
            flash[:error] = "Oh snap! An error occured. Try and submit again."
            redirect_to new_contact_path
        end
    end
  
    private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end