class Player < ActiveRecord::Base

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      # scoped
      all
    end
  end
end
