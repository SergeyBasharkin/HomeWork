class User
  attr_accessor :age, :name, :phone, :address, :comments
  def initialize(name,age,phone,address,comments)
    @age,@name,@phone,@address,@comments=age,name,phone,address,comments
  end
end
class UserCollection
  def initialize()
    @users = []
  end

  def add(user)
    @users << user
  end

  def get(index)
    @users[index]
  end

  def print()
    @users.each {
      |user| puts("#{user.name},#{user.age},#{user.phone},#{user.address},#{user.comments}")
    }
  end
  def method_missing(name,param)

    name = name[8..-2]
    if (name=="age")
      @users.sort!{
        |x,y| x.age.to_i<=> y.age.to_i
      }
    else
    @users.sort! {
        |x,y| x.send(name) <=> y.send(name)
    }
    end
  end
end
class CsvData
  def initialize(path)
  @file=File.open(path)
  @head=@file.gets
  end
  def readFile(userCollection)
    while (param=@file.gets)
      arr=param.split(",")
      userCollection.add(User.new(arr[0],arr[1],arr[2],arr[3],arr[4]))
    end
    @file.close
    return userCollection
  end
end


data=CsvData.new('/home/sergey/data.csv')
 userCollection=UserCollection.new()
userCollection=data.readFile(userCollection)
userCollection.sort_by_phone!(true)
userCollection.print
