	class Album < ApplicationRecord
	has_many :images

	validates :title, :location, :album_description, :price, {presence: true}
	has_attached_file :image, styles: { large: "1920x1080>", medium: "300x300>"}, :url =>':s3_domain_url', :path => '/:class/:attachment/:id_partition/:style/:filename'
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
