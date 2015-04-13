class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "<%= file_name.classify %>"
  belongs_to :rateable, :polymorphic => true

  #attr_accessible :rate, :dimension

	after_save do
		if dirichlet_method
			update_rate_average_dirichlet(stars, dimension)
		else
			update_rate_average(stars, dimension)
		end
	end
end
