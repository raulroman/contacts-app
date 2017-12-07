class ContactsController < ApplicationController

  def index
    #Show all contacts
    contacts = Contact.all
    render json: contacts.as_json
  end

  def show
    the_id = params['id']
    single_contact = Contact.find_by(id: the_id)
    render json: single_contact.as_json
  end

  def destroy
    the_id = params['id']
    single_contact = Contact.find_by(id: the_id)
    destroy.contacts
    render json: {message: "You deleted a contact"}
  end

  def create
    contacts = Contact.new(
    first_name: params['first_name'],
    last_name: params['last_name'],
    email: params['email'],
    phone_number: params['phone_number']
    )


      
  end
end
