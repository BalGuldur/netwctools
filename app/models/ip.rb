class Ip < ActiveRecord::Base
  # Таблица IP адресов связанных с оборудованием
  # TODOlater добавить валидацию на формат regexp ip

  has_and_belongs_to_many :switches
end
