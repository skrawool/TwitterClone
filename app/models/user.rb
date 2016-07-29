
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets

  has_many :favorites
  has_many :tweet_favorites, :through => :favorites, :foreign_key => "user_id", source: "tweet"
end
