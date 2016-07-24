class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming_events
    where("starts_at > ?", Time.now).order("starts_at")
  end

  def venue_name
    venue ? venue.name : nil
  end

  def self.search_by_name(name)
      where("lower(name) LIKE ?", "%#{name.downcase}%")
  end
end
