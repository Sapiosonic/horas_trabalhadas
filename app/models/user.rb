class User < ApplicationRecord
  validates_presence_of :login, :password, :name, :email, message: "não pode ser vázio"
  validates_length_of :login, :in => 5..50, message: "deve ter entre 5 e 50 caracteres!"
  validates_length_of :password, :in => 5..50, message: "deve ter entre 5 e 50 caracteres!"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, message: "inválido!"
  validates_uniqueness_of :login, message: "indisponível."
  validates_uniqueness_of :email, message: "indisponível."
end
