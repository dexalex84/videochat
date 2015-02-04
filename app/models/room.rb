class Room < ActiveRecord::Base
	validates :name 		, presence: true
	validates :sessionId	, presence: true
	validates :public		, presence: true
end
