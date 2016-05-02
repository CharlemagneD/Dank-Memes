class DankUser < ActiveRecord::Base
	acts_as_voter
	has_karma :memes, :as => :submitter, :weight => [1,1]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :memes
end
