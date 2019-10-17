module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings
  end

  def add_tag(name)
    tag = Tag.where(name: name).first_or_create
    self.taggings.where(tag: tag).first_or_create
  end

  def tag_list
    tags.map { |tag| tag.name.include?(' ') ? "'#{tag.name}'" : tag.name }.join(' ')
  end

  module ClassMethods
    def tag_list
      taggings = Tagging.includes(:tag).where(taggable_type: self.base_class.name.to_s)
      taggings.collect { |tagging| tagging.tag.name }.uniq
    end
  end
end
