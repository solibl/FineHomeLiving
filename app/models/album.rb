	class Album < ApplicationRecord
	has_many :images

	validates :title, :location, :album_description, :price, {presence: true}
	has_attached_file :image, styles: { large: "1280x960>", medium: "300x300>"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
