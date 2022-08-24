# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tickets, dependent: :destroy
  validates :name, :description, presence: true
end
