# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tickets
  validates :name, :description, presence: true
end
