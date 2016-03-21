class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true, uniqueness: true

  def self.dfaqui_title
    "DF Aqui"
  end

  def self.dfaqui_content
    self.find_by_code('df_aqui').content rescue ""
  end
end
