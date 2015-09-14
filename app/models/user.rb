class User < ActiveRecord::Base
  has_many :events, foreign_key: 'participant_id'
  has_many :created_routes, class_name:'Route', foreign_key: 'creator_id'
  has_many :running_routes, through: :events, source: :route

  validates :email, presence: true, uniqueness: true
  validates :user_name, presence: true, uniqueness: true
  validates :hashed_password, presence: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def login(password)
    self.password == password
  end
end
