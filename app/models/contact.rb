class Contact < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  # validates :email,

  def as_json
    {
    first_name: first_name,
    last_name: last_name,
    full_name: full_name,
    email: email,
    japan_phone_number: japan_phone_number,
    updated_at: friendly_updated_at
    }
  end

  def friendly_updated_at
    updated_at.strftime("%A, %b %d")
  end

  def full_name
    full_name = "#{first_name} #{last_name}"
  end

  def japan_phone_number
    "+86 #{phone_number}"
  end
end

# ● An email
# ● There must be a first name
# ● There must be a last name
# ● The email must be unique
# ● Bonus: The email must be in a proper format.

#     For your contacts app:
# • Add the “friendly” updated at attribute to your contact json output.


# • Add a full_name method to your own contacts app.

# • Bonus: People from Japan are loving your app! In fact, you’ve discovered that the only people using your app are from Japan. Unfortunately, they haven’t been adding their country code to their phone numbers. Create a model method that will add the Japanese prefix +81 to show up on the index and show page of phone numbers (ex: +81 4322 5109).
