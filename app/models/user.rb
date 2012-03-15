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
                       
  before_save :encrypt_password 
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
 
  def self.authenticate(email, submitted_password) #
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
    
  end
  
  private  #uporabljamo jo lahko samo znotraj razreda
    def encrypt_password 
            self.salt = make_salt if new_record? # object kreiran znotraj  razreda
            self.encrypted_password = encrypt(password) #znotraj razreda lahko uporabljamo self
    end
    
    def encrypt(string)
     secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
end
