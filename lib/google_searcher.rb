require 'launchy'
require 'nokogiri'
require 'open-uri'
require 'rspec'

# création de la méthode pour lancer le site choisi:
def open_url(url)
    Launchy.open("https://www.google.com/")
end

# création de la méthode pour récupérer les résultats:
def get_search_results(query)
  doc = Nokogiri::HTML5(URI.open("https://www.google.com/search?q=#{query}"))

# création de l'array de ces résultats  
  results = []
# Récupération des titres des résultats de recherche
   results = doc.css('h3').map { |node| node.text }
  
   results
end

# si l'utilisateur ne rentre pas de recherche en lançant le programme:
if ARGV.empty?
    puts "Veuillez entrer une recherche:"
    query = gets.chomp
else
    query = ARGV.join(" ")
end
  
puts "Recherche Google pour : #{query}"
  
# Appel de la méthode pour récupérer les résultats de recherche
results = get_search_results(query)
  
# Affichage des résultats, avec ajout d'une condition s'il n'y pas de résultats:
if results.empty?
    puts "Aucun résultat trouvé."
else
    puts "\nRésultats de la recherche :"
    results.each_with_index do |result, index|
      puts "#{index + 1}. #{result}"
    end
end