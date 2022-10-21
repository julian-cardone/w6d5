require 'date'
require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = []

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: {in: CAT_COLORS}
    validates :sex, inclusion: {in: ["M", "F"]}
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date > DateTime.now
            errors.add(:birth_date, "cannot be in the future")
        end
    end

    def age
        from_time = DateTime.now - birth_date.year - birth_date.month - birth_date.day
        time_ago_in_words(from_time)
    end
end