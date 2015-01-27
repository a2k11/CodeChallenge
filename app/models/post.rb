class Post < ActiveRecord::Base
  attr_accessible :tag_list, :title, :slug, :content, :url, :draft
  acts_as_ordered_taggable
  acts_as_url :title, :url_attribute => :slug
  belongs_to :user

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  default_scope order('created_at desc')

  def to_param
    slug
  end

  def external?
    url.present?
  end

  def has_more_tag
    content =~ /<!--\s*more\s*-->/i ? true : false
  end

  def excerpt
    if content.index(/<!--\s*more\s*-->/i)
      content.split(/<!--\s*more\s*-->/i)[0]
    else
      content
    end
  end
end
