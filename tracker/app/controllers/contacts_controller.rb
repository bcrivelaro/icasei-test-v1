class ContactsController < ApplicationController
  def create
    @form = ContactCreateForm.new(contact_params)

    if @form.save
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def contact_params
    params.permit(:email, :name)
  end
end
