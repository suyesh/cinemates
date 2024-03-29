class Movie < ApplicationRecord
  ## Utility Helper Concerns ###################################################
  ##############################################################################
  include DateHelper

  ## Defaults ##################################################################
  ##############################################################################
  paginates_per 56

  ## Concerns ##################################################################
  ##############################################################################
  include MovieConcerns::Relationships
  include MovieConcerns::Scopes
end
