class Review < ActiveRecord::Base
    validates :body, presence: true, length: {minimum:2, maximum:25}
    belongs_to :chef
    belongs_to :recipe
    validates_uniqueness_of :chef, scope: :recipe
end