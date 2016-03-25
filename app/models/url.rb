class Url < ActiveRecord::Base

validates_format_of :long_url, :with => URI::regexp(%w(http https)), :message => '%{value} is not a valid URL.'
	
	def self.generate_short_url
		SecureRandom.hex(3)
	end
end
