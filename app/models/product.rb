class Product < ApplicationRecord
    has_many :medials
    has_many :comments
    has_many :categories, through: :medials
    validates :name, length: { minimum: 3 }
    accepts_nested_attributes_for :categories
    mount_uploaders :avatars, AvatarUploader
    serialize :avatars, JSON
    self.per_page = 1
end
