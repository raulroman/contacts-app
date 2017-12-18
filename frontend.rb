require 'unirest'
require 'pp' 

p "Welcome to my contacts app!"
p "Choose from the following"
p "[1] View all contacts"
p "[2] View a particular contact"
p "[3] Create a new contact"
p "[4] Update a contact"
p "[5] Delete a contact" 
p "[6] Sign up"

user_input = gets.chomp

if user_input == "1"
  response = Unirest.get("localhost:3000/v1/contacts")
    
  contacts = response.body
  pp contacts
elsif user_input == "2"
  p "What is the id of the contact?"
  contact_id = gets.chomp
  response = Unirest.get("localhost:3000/v1/#{contact_id}")
  contact = response.body
  pp contact
elsif user_input == "3"
  the_params = {}
  p "what is the name"
  the_params[:first_name] = gets.chomp
  p "what is the last name"
  the_params[:last_name] = gets.chomp
  p "what is the email"
  the_params[:email] = gets.chomp
  p "What is the phone number"    
  the_params[:phone_number] = gets.chomp
  response = Unirest.post("localhost:3000/v1/contacts?", parameters: the_params)
  contact = response.body
  pp contact
elsif user_input == '4'
  the_params = {}
  p "Which contact would you like to update?"
  contact_id = gets.chomp
  response = Unirest.get("localhost:3000/v1/#{contact_id}")
  pp response.body
  p "what is the first name"
  the_params[:first_name] = gets.chomp
  p "what is the last name"
  the_params[:last_name] = gets.chomp
  p "what is the email"
  the_params[:email] = gets.chomp
  p "what is the phone number"
  the_params[:phone_number] = gets.chomp
  response = Unirest.patch("localhost:3000/v1/#{contact_id}", parameters: the_params)
  p response.body
elsif user_input == '5'
  p "which contact would you like to delete"
  contact_id = gets.chomp
  response = Unirest.delete("localhost:3000/v1/#{contact_id}")
            
elsif user_input == '6'
  the_params = { }
  p "what is your username?"
  the_params[:name] = gets.chomp
  p "What is your email?"
  the_params[:email] = gets.chomp
  p "Create is your password"
  the_params[:password] = gets.chomp
  p "Type in password again to confirm"
  the_params[:password_confirmation] = gets.chomp
  response = Unirest.post("localhost:3000/v1/users", parameters: the_params)
  pp response.body

      
end