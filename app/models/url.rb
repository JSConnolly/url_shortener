class Url < ActiveRecord::Base
  belongs_to :user
  
  before_create :create_short_url
  VALID_URL_REGEX = /(http:)?(www\.)?.*\.\w{2,5}($|\/.*)/
  validates :long_url, format: { with: VALID_URL_REGEX }
  # attr_accessor :long_url, :short_url
  #TODO validate uniqueness of short url before saving
  # validates :short_url, uniqueness: true
  
  def create_short_url
    rand_url = ('a'..'z').to_a.shuffle[0..5].join
    self.short_url = "#{rand_url}"
  end
end
