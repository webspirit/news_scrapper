class Article < ActiveRecord::Base
	belongs_to :user

	validates :title, :author, :body, :published_date, presence: true
	validates :image_url, :url => {:allow_blank => true}
end
