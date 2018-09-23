module MovieConcerns
  module Scopes
    extend ActiveSupport::Concern

    included do

      default_scope { where('poster_path IS NOT NULL') }

      scope :upcoming, -> {
        where(
          'release_date >= ? AND release_date <= ?',
          today_date,
          thirty_days_from_now
        ).order('popularity DESC,release_date DESC NULLS LAST')
      }

      scope :now_playing, -> {
        where(
          'release_date >= ? AND release_date <= ?',
          sixty_days_earlier,
          today_date
        ).order('popularity DESC,release_date DESC NULLS LAST')
      }

      scope :top_rated, -> {
        where(
          'vote_average >= ? AND vote_count >= 100',
          5
        ).order('vote_average DESC, popularity DESC')
      }

      scope :low_rated, -> {
        where(
          'vote_average <= ? AND vote_count >= 100',
          5
        ).order('vote_average ASC,popularity DESC')
      }

      scope :popular, -> {
        order('popularity DESC, vote_average DESC')
      }
    end
  end
end
