class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :creator, class_name: 'User'
  has_many :ticket_types
  scope :published, -> {where(is_published: true)}

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming_events
    published.where("starts_at > ?", Time.now).order("starts_at")
  end

  def venue_name
    venue ? venue.name : nil
  end

  def is_out_of_date?
    starts_at < Time.now
  end

  def self.search_by_name(name)
      where("lower(name) LIKE ?", "%#{name.downcase}%")
  end
end
