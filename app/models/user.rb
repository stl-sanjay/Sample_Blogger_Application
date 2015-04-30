class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         has_many :blogs
         
         has_attached_file :photo,
                           :default_url => "missing.jpg",
                           :styles => { :thumb => "100x100" },
                           # Stored image on dropbox using dropbox-paperclip gem
                           :storage => :dropbox,
                           :dropbox_credentials => Rails.root.join("config/dropbox.yml"),:dropbox_visibility => 'public'
          validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  # devise confirm! method overriden
  def confirm!
    welcome_message
    super
  end

  # Password validation during registration
  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  # calling mailer method from User_mailer controller
  private
    def welcome_message
      UserMailer.welcome_email(self).deliver
    end
end