class V1::ContactsController < ApplicationController

  def index
    #Show all contacts
    contacts = Contact.all
    render json: contacts.as_json
  end


  def show
    contact = Contact.find_by(id: params[:id])
    render json: contact.as_json
  end


  def create
    contact = Contact.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    phone_number: params[:phone_number]
    )
    if contact.save
      render json: contact.as_json
    else
      render json: {errors: contact.errors.full_messages}
    end
  end

  def update
    contact = Contact.find_by(id: params[:id])
    contact.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number])
    render json: contact.as_json

    
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    destroy.contacts
    render json: {message: "You deleted a contact"}
  end
  
end
