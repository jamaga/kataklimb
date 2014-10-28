class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, presence: true, length: { in: 2..25 }

  scope :visible, -> { where(visible: true) }
  scope :hidden,  -> { where(visble: false) }
end
