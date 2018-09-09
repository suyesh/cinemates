module MovieConcerns
  module Scopes
    extend ActiveSupport::Concern

    included do
      scope :upcoming, -> { where('release_date BETWEEN ? AND ?', today_date, thirty_days_from_now).order('release_date DESC') }
      scope :now_playing, -> { where('release_date BETWEEN ? AND ?', sixty_days_earlier, today_date).order('release_date DESC') }
      scope :top_rated, -> { where('vote_average > ? AND vote_count > 1500', 6 ).order('vote_average DESC') }
      scope :low_rated, -> { where('vote_average <= ? AND vote_count > 100', 5 ).order('vote_average ASC') }
    end
  end
end
