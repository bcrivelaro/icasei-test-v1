class ContactCreateForm
  include ActiveModel::Model

  attr_accessor :email, :name, :contact

  validates :email, :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def initialize(contact_params)
    @email = contact_params[:email]
    @name  = contact_params[:name]
  end

  def save
    return true if email_registered?
    return unless valid?

    @contact = Contact.create!(
      email: email,
      name: name
    )
  end

  private

  # The test specification does not explain what should happen when a already registered contact
  # sends another form request. So, this form object will just ignore when the email is already registered.
  def email_registered?
    Contact.where(email: email).count(1) > 0
  end
end