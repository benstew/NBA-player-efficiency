# require libraries/modules here
require 'HTTParty'
require 'nokogiri'
require 'JSON'
require 'pry'
require 'csv'

# page = HTTParty.get('http://stats.nba.com/tracking/#!/player/possessions/?sort=TOUCHES&dir=1')
# parse_page = Nokogiri::HTML(page)


def create_stats_hash
  html = File.read('fixtures/stats.html')
  stats_html = Nokogiri::HTML(html)

  stats_extract = {}
  counter = 1

  # stats_html.css(".table tbody .ng-scope").each do |player|
  stats_html.css(".table tbody .each-player").each do |player|

    stats_extract[counter] = {
      :name => player.css(".ng-binding")[0].text,
      :team => player.css(".ng-binding")[1].text,
      :games_played => player.css(".ng-binding")[2].text,
      :wins => player.css(".ng-binding")[3].text.to_f,
      :losses => player.css(".ng-binding")[4].text.to_f,
      :minutes => player.css(".ng-binding")[5].text.to_f,
      :points => player.css(".ng-binding")[6].text.to_f,

      # The number of times a player touches and possesses the ball during the game
      :touches => player.css(".ng-binding")[7].text.to_f,

      # The number of minutes that a player possess the ball
      :time_of_possession => player.css(".ng-binding")[9].text.to_f,

      # The points scored by a player or team per touch
      :points_per_touch => player.css(".ng-binding")[12].text.to_f
    }

    binding.pry




    # Data returned from the scraper has extra white spaces
    # unformatted_question = project.css("div.question-segment").text
    # unformatted_answer = project.css("div.faq-answer-container").text

    # projects[counter] = {
    #   # Formatting the text before pushing into our projects hash
    #   # :question => unformatted_question.strip,
    #   # :answer => unformatted_answer.strip
    # }
    counter += 1
  end
  projects
end

create_stats_hash
