#encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :logotipo, :logotipo_delete
  # attr_accessible :title, :body

  has_attached_file :logotipo,
                    :storage => :s3, :s3_credentials => S3_CREDENTIALS,
                    :path => "/system/:class/:id/:style/:basename.:extension"

  validates_attachment_size :logotipo, :in => 0..100.kilobytes, :message => "deve ser menor do que 100KB"
  validates_attachment_content_type :logotipo, :content_type => ['image/jpeg', 'image/png']                    

  has_many :atletas, :dependent => :destroy
  has_many :arbitros, :dependent => :destroy
  has_many :tecnicos, :dependent => :destroy

  before_save :destroy_logotipo?

  def logotipo_delete
    @logotipo_delete ||= "0"
  end

  def logotipo_delete=(value)
    @logotipo_delete = value
  end

private
  def destroy_logotipo?
    self.logotipo.clear if @logotipo_delete == "1"
  end
end
