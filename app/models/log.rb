class Log < ApplicationRecord
  belongs_to :user
  belongs_to :grow_plant

  def start_time
    self.created_at
  end
end
