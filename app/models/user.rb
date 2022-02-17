class User < ApplicationRecord
  belongs_to :city, optional: true
  has_many :gossips
  has_many :commments

  # has_secure_password

  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  # validates :password,
  #   presence: {message: "Il nous faut un mot de passe pour sécuriser le compte."},
  #   length: {minimum: 6, message: "Le mot de passe doit avoir au moins 6 caractères."}
end