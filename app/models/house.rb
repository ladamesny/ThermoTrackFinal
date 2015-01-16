class House < ActiveRecord::Base

  has_many :thermometers, dependent: :destroy
  belongs_to :user

  validates_presence_of :name


end