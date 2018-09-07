module DateHelper
  extend ActiveSupport::Concern

  module ClassMethods
    def today_date
      (DateTime.now).strftime('%Y-%m-%d').to_date
    end

    def thirty_days_from_now
      (DateTime.now + 30).strftime('%Y-%m-%d').to_date
    end

    def sixty_days_earlier
      (DateTime.now - 60).strftime('%Y-%m-%d').to_date
    end
  end
end
