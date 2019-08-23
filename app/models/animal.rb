class Animal < ApplicationRecord
  validates_presence_of :name, :species, :sex, :birthday
  validate :birthday_valid
  validate :arrival_date_valid
  before_save :confirm_arrival_date

  def birthday_valid
    if birthday
      unless (birthday < Date.today.next_day)
        errors.add(:birthday, "can't be in the future")
      end
    end
  end

  def arrival_date_valid
    if birthday && arrival_date
      if (arrival_date < birthday)
        errors.add(:arrival_date, "can't be before birthday")
      elsif (arrival_date > Date.today.next_day)
        errors.add(:arrival_date, "can't be in the future")
      end
    end
  end

  def confirm_arrival_date
    self.arrival_date ||= Date.today
  end
end
