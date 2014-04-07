require 'nokogiri'
require 'open-uri'

cohorts = ['https://socrates.devbootcamp.com/cohorts/41',
           'https://socrates.devbootcamp.com/cohorts/45',
           'https://socrates.devbootcamp.com/cohorts/46']

cookie = "__cfduid=d573bfe6fcbd1586bff5d3e1efb88b3731391546611458; __utma=90740239.1185666478.1391546612.1396221751.1396221762.4; __utmz=90740239.1396221762.4.3.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); _dbc_socrates_session=BAh7CEkiD3Nlc3Npb25faWQGOgZFRkkiJTk5YTMwODA1YzVhYjZlMmVjOTMzZDljODQzZmZhNTYxBjsAVEkiEF9jc3JmX3Rva2VuBjsARkkiMW0vNEtFaDNwa001NkVlVy9BYTd1VlJSVjNMNmJZN1BNcWIxTzJia09wN0U9BjsARkkiDXVzZXJfaWRzBjsARlsGaQKEAw%3D%3D--6a68260d5121bcdd2f8b3d8548e3f24308b20941"

user_file = File.open('./user_url.txt', 'w+')

cohorts.each.with_index do |cohort_url, index|
  doc = Nokogiri::HTML(open(cohort_url, 'Cookie' => cookie))
  doc.css('.user').each do |user|
    user_file.write "#{index+1}, https://socrates.devbootcamp.com#{user.children[1].attributes['href'].value}\n"
  end
  puts "scraping #{cohort_url}..."
  sleep(0.1)
end

user_file.rewind

user_info_file = File.open('./user_info.txt', 'w+')

user_file.each do |user_info|
  cohort_id, user_url = user_info.chomp.split(', ')
  user_page = Nokogiri::HTML(open(user_url, 'Cookie' => cookie))
  name_array = user_page.css('.breadcrumb li')[2].text.strip.split
  first_name, last_name = name_array.first, name_array.last
  email = user_page.css('.dl-horizontal dd').first.text
  description = user_page.css('blockquote').first.text.strip.gsub(/\r\n/, '').gsub(/"/, '')
  user_info_file.write "{\"first_name\": \"#{first_name}\", \"last_name\": \"#{last_name}\", \"email\": \"#{email}\", \"cohort_id\": #{cohort_id}, \"description\": \"#{description}\"}\n"
  puts "scraping #{first_name} #{last_name}..."
  sleep(0.1)
end

'{"first_name": "Adam", "last_name": "Willis", "email": "adam.willis@woodhouse.com", "cohort_id": 1}'
