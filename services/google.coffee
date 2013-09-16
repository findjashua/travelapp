request = require 'request'

prefix = 'https://www.googleapis.com/customsearch/v1?'
apiKey = 'AIzaSyAich_IdDKurJdZqpUuvvzl_5A_4IiylEM'
cseId = '010026617731786985188:slp4zesmd5g'
baseUrl = "#{prefix}key=#{apiKey}&cx=#{cseId}&searchType=image&alt=json"

exports.getImages = (param, callback)->
	url = "#{baseUrl}&q=#{param.query}"
	request.get url, (err, res, body)->
		return callback err, null if err?
		json = JSON.parse(body)
		items = json.items
		links = []
		for item in items
			links.push item.link
		callback null, links


