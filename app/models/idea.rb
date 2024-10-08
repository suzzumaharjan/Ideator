class Idea < ApplicationRecord
    validates :description, :title, presence: true
end
