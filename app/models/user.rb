class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buying_services, class_name: "Service", foreign_key: :service_id, dependent: :destroy
  has_many :selling_services, class_name: "Service", foreign_key: :service_id, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews


end
