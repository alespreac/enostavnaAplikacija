class User < ActiveRecord::Base
  attr_accessible :name, :email #preprecis uporabnikom dostop do 
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, :presence => true, #preprecis da bi bilo ime prazno
                   :length   => { :maximum => 50 }
  validate :email, :presence => true,
                   :format => { :with => email_regex},
                   :uniqueness => true
end
