def update_parser
     url = 'https://www.cubecinema.com/programme'
html = open(url)

doc = Nokogiri::HTML(html)

showings = []

doc.css('.showing').each do |showing|
	showing_id = showing['id'].split('_').last.to_i
  	tags = showing.css('.tags a').map { |tag| tag.text.strip }
  	title_el = showing.at_css('h3')
  	title_el.each { |c| c.remove if c.name == 'span' }
 	title = title_el.text.strip
 	dates = showing.at_css('.start_and_pricing').inner_html.strip
  	dates = dates.split('<br>').map(&:strip).map { |d| DateTime.parse(d) }
  	description = showing.at_css('.copy').text.gsub('... [more]', '').strip
  	showings.push(
    	id: showing_id,
    	title: title,
    	tags: tags,
    	dates: dates,
    	description: description
  )
end

File.write('storage/reviews.json', JSON.pretty_generate(showings))
end

def get_parser
  file = File.read('storage/reviews.json')
  @movie.parse = JSON.parse(file)
end