require File.dirname(__FILE__) + '/../../config/environment.rb'
require 'colorize'

EXISTING_PRODUCTION_COMPANIES = ProductionCompany.pluck(:name)
MOVIES_PRODUCTION_COMPANIES = Movie.pluck(:production_companies, :id)

Movie.pluck(:production_companies).flatten.compact.uniq.each do |pr|
  unless EXISTING_PRODUCTION_COMPANIES.include?(pr)
    puts "Creating #{pr}"
    ProductionCompany.create!(name: pr)
  end
end


MOVIES_PRODUCTION_COMPANIES.each do |pr|
  movie_id = pr[1]
  pr = pr[0]
  unless pr.length < 1
    pr.each do |production_company|
      pc = ProductionCompany.find_by(name: production_company)
      m = Movie.find_by(id: movie_id)
      pc.movies << m unless pc.movies.pluck(:id).include?(m.id)
      puts "Added #{m.title} to #{pc.name}"
    end
  end
end
