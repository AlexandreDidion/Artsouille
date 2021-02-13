class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def set_art_types
    ['Painting', 'Photography', 'Sculpture', 'Ceramic', 'Music', 'Street art', 'Performance', 'Other']
  end
end
