module MovieConcerns
  module Scopes
    extend ActiveSupport::Concern

    included do
      scope :upcoming, -> {
        where(
          'release_date >= ? AND release_date <= ?',
          today_date,
          thirty_days_from_now
        ).order('release_date DESC NULLS LAST')
      }

      scope :now_playing, -> {
        where(
          'release_date >= ? AND release_date <= ?',
          sixty_days_earlier,
          today_date
        ).order('release_date DESC NULLS LAST')
      }

      scope :top_rated, -> {
        where(
          'vote_average > ? AND vote_count > 1500',
          6
        ).order('vote_average DESC NULLS LAST')
      }

      scope :low_rated, -> {
        where(
          'vote_average <= ? AND vote_count > 100',
          5
        ).order('vote_average ASC NULLS LAST')
      }
    end
  end
end
