# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: Rails.application.credentials.gmail[:user_name], subject: 'お問い合わせ内容'
  end
end
