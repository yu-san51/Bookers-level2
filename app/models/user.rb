class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, presence:true, length: {minimum: 2, maximum: 20}
  validates :introduction, presence:true, length: {maximum: 50}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def remember_me
  	true
  end

  has_many :books, dependent: :destroy
  attachment :profile_image
end
