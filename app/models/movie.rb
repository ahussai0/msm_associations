class Movie < ApplicationRecord
#  Movie:
# - director_id: must be present
validates :director_id, :title, presence: true
# - title: must be present; must be unique in combination with year
validates :title, uniqueness: { scope: :year}


# - year: must be integer between 1870 and 2050
validates :year, numericality: { only_interger: true, greater_than_or_equal_to: 1870}
validates :year, numericality: { less_than_or_equal_to: 2050}
# - duration: must be integer between 0 and 2764800
validates :duration, numericality: { only_interger: true, greater_than_or_equal_to: 0}
validates :duration, numericality: { less_than_or_equal_to: 2764800}
# - description: no rules
# - image_url: no rules
belongs_to :director, :class_name => "Director", :foreign_key => "director_id"
has_many :characters, :class_name => "Character", :foreign_key => "character_id"
has_many :characters
has_many :actors, :through => :characters
end
