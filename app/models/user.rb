class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :chats
  has_many :messages, dependent: :destroy

  def name
    email.split('@')[0]
  end

  def online?
    updated_at > 5.minutes.ago
  end
end
