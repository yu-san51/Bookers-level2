class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, presence:true, length: {minimum: 2, maximum: 20}
  validates :introduction, length: {maximum: 50}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  def remember_me
  	true
  end

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follow_id"
  has_many :followers, through: :reverse_of_relationships, source: :user

  attachment :profile_image

      #フォロー
    def follow(other_user)
      unless self == other_user
        self.relationships.find_or_create_by(follow_id: other_user.id)
      end
    end
      #フォロー外す
    def unfollow(other_user)
      relationship = self.relationships.find_by(follow_id: other_user.id)
      relationship.destroy if relationship
    end
      #ログイン中のユーザーがフォローしたらtrue
    def following?(other_user)
      self.followings.include?(other_user)
    end


      #search
    def self.search(search, word)
      if search == "forward_match"  #前方
        @users = User.where("name LIKE?", "#{word}%")
      elsif search == "backward_match"  #後方
        @users = User.where("name LIKE?", "%#{word}")
      elsif search == "perfect_match"  #完全
        @users = User.where("#{word}")
      elsif search == "partial_match"  #部分
        @users = User.where("name LIKE?", "%#{word}%")
      else
        @users = User.all
      end
    end

      #address-search
    include JpPrefecture
    jp_prefecture :prefecture_code

    def prefecture_name
      JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
    end

    def prefecture_name=(prefecture_name)
      self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
    end


end
