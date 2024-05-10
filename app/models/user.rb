class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  #   has_many :orders

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  validates :password,
            format: { with: /\A(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9]+\z/, message: 'must include both letters and numbers' }
  validates :last_name, :first_name, presence: true,
                                     format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'must be full-width Japanese characters' }
  validates :last_name_kana, :first_name_kana, presence: true,
                                               format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be full-width katakana characters' }
end
