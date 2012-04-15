class App < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :description, :email, :url, :event, :twitter, :avatar
  has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "100x100>" }

  validates_presence_of :name, :description, :email, :url, :twitter
end
