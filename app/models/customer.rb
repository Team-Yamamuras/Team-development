class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
         
  has_many :shipping_address, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  #マイページ編集バリデーション
  validates :first_name, :last_name, :first_name_kana, :last_name_kana,:zip_code, :address, :phone_number, presence: true
  validates :first_name_kana, :last_name_kana,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "カタカナで入力して下さい。"}
            
  
end
