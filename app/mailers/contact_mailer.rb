class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail to: 'e.t.s.w.a.n.a@gmail.com', subject: 'お問い合わせ内容'
  end

end
