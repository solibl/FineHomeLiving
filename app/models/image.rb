class Image < ApplicationRecord
	belongs_to :album

	validates :name, :description, {presence: true}
	has_attached_file :image, styles: { large: "1000x1000>", medium: "300x300>"}, :url =>':s3_domain_url', :path => '/:class/:attachment/:id_partition/:style/:filename'
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
 	do_not_validate_attachment_file_type :image
end
