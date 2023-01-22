class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :posts
  has_many :realestates
  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

# optional, if we want thumbnail for avatar
  def avatar_thumbnail
    avatar.variant(resize: "150x150!").processed
  end

  private

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'https://res.cloudinary.com/dlzusxobf/image/upload/v1674377649/sistach_favicon_c9rb1y.png'
          )
        ), filename: 'https://res.cloudinary.com/dlzusxobf/image/upload/v1674377649/sistach_favicon_c9rb1y.png',
        content_type: 'image/png'
      )
    end
  end

end
