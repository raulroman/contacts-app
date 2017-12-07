class Contact < ApplicationRecord
  def as_json
    {
    first_name: first_name,
    last_name: last_name,
    full_name: full_name,
    email: email,
    phone_number: phone_number
    }
  end

  def full_name
    full_name = "#{first_name} #{last_name}"
  end
end
#     For your contacts app:
# • Add the “friendly” updated at attribute to your contact json output.


# • Add a full_name method to your own contacts app.

# • Bonus: People from Japan are loving your app! In fact, you’ve discovered that the only people using your app are from Japan. Unfortunately, they haven’t been adding their country code to their phone numbers. Create a model method that will add the Japanese prefix +81 to show up on the index and show page of phone numbers (ex: +81 4322 5109).
