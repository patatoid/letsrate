class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "<%= file_name.classify %>"
  belongs_to :rateable, :polymorphic => true

  #attr_accessible :rate, :dimension

	after_save do
		self.rateable.update_rate_average(stars, dimension)
	end
end
