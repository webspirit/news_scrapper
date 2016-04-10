class Scrape
	attr_accessor :title, :author, :image_url, :published_date, :subtitle, :body, :category, :failure

	def scrape_new_article(url)
		begin
			doc = Nokogiri::HTML(open(url))
			doc.css('script').remove
			self.title = doc.xpath("//h1").text.gsub("\n","")
			self.author = doc.xpath("//a[@rel='author']").text
			self.image_url = doc.at_css('.maxed')['src']
			self.published_date = doc.at_css('.content__dateline-wpd')['datetime']
			self.subtitle = doc.xpath("//div[@class='content__standfirst']").text.gsub("\n","")
			self.body = doc.xpath("//div[@itemprop='articleBody']").text
			self.category = doc.xpath('//div[@data-component="keywords"]//ul//li').text.gsub("\n\n\n\n", ", ").gsub("\n", "")
			return true
		rescue Exception => e
			self.failure = "Article couldn't be scrapped due to some error."
		end
	end
end