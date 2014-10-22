class Player < ActiveRecord::Base
  attr_accessible :image, :name, :player_image, :remote_player_image_url, :password, :password_confirmation
  mount_uploader :player_image, PlayerImageUploader

  has_secure_password

  has_many :games_as_player1, foreign_key: :player1_id, class_name: 'Game'
  has_many :games_as_player2, foreign_key: :player2_id, class_name: 'Game'
  has_many :moves

  # validates :password, presence: true, on: :create
  # validates :name, presence: true
  # validates :name, uniqueness: { case_sensitive: false }

  # def self.authenticate(name, password)
  #   player = find_by_name(name)
  #   if player && player.password_hash == BCrypt::Engine.hash_secret(password, player.password_salt)
  #     player
  #   else
  #     nil
  #   end
  # end
  
  # def encrypt_password
  #   if password.present?
  #     self.password_salt = BCrypt::Engine.generate_salt
  #     self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  #   end
  # end

end
