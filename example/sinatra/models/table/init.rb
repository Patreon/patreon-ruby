require "data_mapper"

DataMapper::setup(:default, "sqlite://#{Dir.pwd}/sqlite.db")

require_relative 'user'

DataMapper.finalize
DataMapper.auto_upgrade!
