class Swmodel < ActiveRecord::Base
  # Собственно таблица моделей свитче

  # TODO добавить objid вместе с валидацией

  validates :name, :company, :presence => true

  has_many :switches
end
