# frozen_string_literal: true

module Public
  class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end

    def confirm
      @contact = Contact.new(contact_params)
    end

    def create
      @contact = Contact.new(contact_params)
      if @contact.save
        ContactMailer.contact_mail(@contact).deliver_now # お問い合わせ内容をデータベースに保存後、メールを送信
        redirect_to root_path
      else
        redirect_to new_contact_path
      end
    end
  end
end

private

def contact_params
  params.require(:contact).permit(:name, :email, :body)
end
