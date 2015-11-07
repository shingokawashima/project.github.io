class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  has_many :messages, class_name: "Message"
  #has_many :requests, class_name: "Request"
  #has_many :bids, class_name: "Bid"
  
  has_many :bidding_bids, class_name:  "Bid",
                                     foreign_key: "bidder",
                                     dependent:   :destroy
  has_many :bidding_requests, through: :bidding_bids, source: :bidded 
  
  
end
