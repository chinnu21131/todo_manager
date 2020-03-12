class User < ActiveRecord::Base
  def to_pleasant_string
    "name : #{name} \t email : #{email} \t password : #{password}"
  end
end
