class App < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :description, :email, :url, :twitter, :avatar
  has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "150x150>" }

  validates_presence_of :name, :description, :email, :url, :twitter
end
