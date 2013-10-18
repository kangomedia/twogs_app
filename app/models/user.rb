class User < ActiveRecord::Base
  before_save { self.username = username.downcase }
  before_create :create_remember_token
  
  validates :name,      presence: true, length: { maximum: 50 }
  validates :username,  presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password,  length: { minimum: 6 }
  
  has_many :attachments, as: :attachable, :dependent => :destroy
  accepts_nested_attributes_for :attachments
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
    
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
    
    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation, :admin, :attachments_attributes [:file, :attachable_id, :attachable_type])
    end
    
end
