#file= File.open('/home/sergey/data.csv')
#file.gets

#people=[]
user_collection=UserCollection.new()
data=UserCollection.new.open_data

user_collection=UserCollection.n
while (params= data.gets)do
#  people << line.split(",")
  user=User.new(params)
  user_collection.add user
end

user_collection.sort_by_age!

user_collection.export_for_file!
#people.map(&:save!)
#people.each { |man| puts man }
#people=people.sort! { |x,y| x[1]<=> y[1] }
#puts people


#file.close
#puts "hello"== stdout << 'hello'
###################################################################
class User
  attr_accessible :age, :name, :phone, :address, :comments
def initialize()

end
end
class UserCollection
  def open_data
    file= File.open('/home/sergey/data.csv')
    file.gets
    return file
  end

  def method_missing(name,params)
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
