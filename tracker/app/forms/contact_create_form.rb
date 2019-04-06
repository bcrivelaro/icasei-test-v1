class ContactCreateForm
  include ActiveModel::Model

  attr_accessor :email, :name, :contact

  validates :email, :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :validate_email_uniqueness

  def initialize(contact_params)
    @email = contact_params[:email]
    @name  = contact_params[:name]
  end

  def save
    return unless valid?

    @contact = Contact.create!(
      email: email,
      name: name
    )
  end

  private

  def validate_email_uniqueness
    return if email.blank?

    if Contact.where(email: email).count(1) > 0
      errors.add(:email, 'has already been taken')
    end
  end
end