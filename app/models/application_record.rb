class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def timestamp
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  def simple_timestamp
    created_at.strftime('%H:%M:%S')
  end
end
