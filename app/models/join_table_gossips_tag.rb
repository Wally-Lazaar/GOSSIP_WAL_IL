class JoinTableGossipsTag < ApplicationRecord
    belongs_to :gossip
    belongs_to :tag
  end
  