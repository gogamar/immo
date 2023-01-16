class Contact < ApplicationRecord
  attribute :name, :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "Formulari de contacte",
      :to => "info@sistachfinques.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
