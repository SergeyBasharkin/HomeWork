class User
  attr_accessible :age, :name, :phone, :address, :comments
  def initialize(params)
    params.split(",")
  end
end
class UserCollection
  def open_data
    file= File.open('/home/sergey/data.csv')
    file.gets
    return file
  end

  def method_missing(name,param)
    if name=='sort_by_age!'
      people=people.sort!{
          |x,y| x[1]<=>y[1]
      }
    end
    if name=='xport_for_file!'
      puts people
    end
  end
end



user_collection=UserCollection.new()
data=UserCollection.new.open_data

while (params= data.gets)do
#  people << line.split(",")
  user=User.new(params)
  user_collection.add user
end

user_collection.sort_by_age!(12)

user_collection.export_for_file!(12)
