class Gossip < ApplicationRecord
  has_many :join_table_gossips_tags
  has_many :tags, through: :join_table_gossips_tags
  belongs_to :user
  has_many :comments


  #   length: { in: 3..14, message: "Le titre doit avoir entre 3 et 14 caractères." },
  validates :title,
    length: { 
    minimum: 3,
    maximum: 14,
    too_short: "Le titre doit contenir au moins %{count} caractères.",
    too_long: "Le titre ne doit pas dépasser %{count} caractères."
    }

  validates :content,
    presence: {message: "Il faut du contenu."}
      
end