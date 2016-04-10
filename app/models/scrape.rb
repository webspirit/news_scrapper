class Scrape
	attr_accessors :title, :author, :image_url, :published_date, :subtitle, :body, :category, :failure

	def scrap_new_article
		begin
			doc = Nokogiri::HTML(open("http://www.theguardian.com/world/2016/apr/10/brussels-attackers-planned-second-assault-on-france-belgian-prosecutors"))
			doc.css('script').remove
			title = doc.xpath("//h1").text.gsub("\n","")
			author = doc.xpath("//a[@rel='author']").text
			image_url = doc.at_css('.maxed')['src']
			published_date = doc.at_css('.content__dateline-wpd')['datetime']
			subtitle = doc.xpath("//div[@class='content__standfirst']").text.gsub("\n","")
			body = doc.xpath("//div[@itemprop='articleBody']").text
			category = doc.xpath('//div[@data-component="keywords"]//ul//li').text.gsub("\n\n\n\n", ", ").gsub("\n", "")
			return true
		rescue Exception => e
			self.failure = "Article couldn't be scrapped due to some error. Please try another article or inspect the code of /app/models/scrape.rb."
		end
	end
end