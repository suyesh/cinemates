require File.dirname(__FILE__) + '/../../config/environment.rb'
require 'colorize'

EXISTING_PRODUCTION_COMPANIES = ProductionCompany.pluck(:name)

Movie.pluck(:production_companies).flatten.compact.uniq.each do |pr|
  unless EXISTING_PRODUCTION_COMPANIES.include?(pr)
    puts "Creating #{pr}"
    ProductionCompany.create!(name: pr)
  end
end


# Movie.all.each do |movie|
#   unless movie.production_companies.length < 1
#     movie.production_companies.each do |pr|
#       production_company = ProductionCompany.find_by(name: pr)
#       production_company << movie unless production_company.movies.include?(pr)
#     end
#   end
# end
