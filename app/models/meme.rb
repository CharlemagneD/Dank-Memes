class Meme < ActiveRecord::Base
	belongs_to :dank_user
	acts_as_voteable
end
