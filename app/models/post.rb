class Post < ActiveRecord::Base
	extend FriendlyId
	friendly_id :tile, use: :slugged
end
