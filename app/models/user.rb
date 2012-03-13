class User < ActiveRecord::Base
  attr_accessor :password
  
  attr_accessible :name, :email, :password, :password_confirmation #preprecis uporabnikom dostop do 
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, :presence => true, #preprecis da bi bilo ime prazno
                   :length   => { :maximum => 50 }
  validates :email, :presence => true,
                   :format => { :with => email_regex},
                   :uniqueness => true
  
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40} #velikost gelsa (med 6 in 40 znaki)
  
  
end
