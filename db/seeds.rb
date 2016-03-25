  class UrlsImporter
  def self.import(filename)
  	short_url = Url.generate_short_url
  	csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
    data = row[0].gsub(/[(,)\n]/, '')	
  	url = Url.create(long_url: data, shortened_url: short_url)
	end
  end
end



# require 'sqlite3'



# module UrlsDB

# csv = CSV.new(File.open(filename), :headers => true)
#     csv.each do |row|
#     data = row[0].gsub(/[(,)\n]/, '')	
#   	url = Url.create(long_url: data)
#   	end

# 	def self.seed
# 		$db.execute(
# 			"
# 			INSERT INTO urls (long_url) VALUES #{data}
# 				