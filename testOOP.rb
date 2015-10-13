class User
  attr_accessor :age, :name, :phone, :address, :comments
  def initialize(name,age,phone,address,comments)
    @age=age
    @name=name
    @phone=phone
    @address=address
    @comments=comments
  end
end
class UserCollection
  @users
  def initialize()
    @users=[]
  end
  def add(user)
    @users << user
  end
  def get(index)
    return @users[index]
  end
  def print()
    @users.each{
      |user| puts(user.name+' '+user.age+' '+user.phone+' '+user.address+' '+user.comments)
    }
  end
  def method_missing(name,param)
    if (name.to_s=='sort_by_name!')
      @users=@users.sort!{
          |x,y| x.name<=>y.name
      }
    end
    if (name.to_s=='sort_by_age!')
     @users.sort!{
          |x,y| x.age.to_i<=>y.age.to_i
      }
    end
    if (name.to_s=='sort_by_phone!')
      @users.sort!{
          |x,y| x.phone<=>y.phone
      }
    end
    if (name.to_s=='sort_by_address!')
      @users.sort!{
          |x,y| x.address<=>y.address
      }
    end
    if(name.to_s=='sort_by_comments')
      @users.sort!{
          |x,y| x.comments<=>y.comments
      }
    end
  end
end
class CsvData
  @file
  def initialize(path)
  @file=File.open(path)
  end
  def get
    @file.
    return @file.gets
  end
  def readFile(userCollection)
    @file.gets
    while (param=@file.gets)
      arr=param.split(",")
      userCollection.add(User.new(arr[0],arr[1],arr[2],arr[3],arr[4]))
    end
    return userCollection
  end
end


data=CsvData.new('/home/sergey/data.csv')
 userCollection=UserCollection.new
userCollection=data.readFile(userCollection)
userCollection.sort_by_age!(true)
userCollection.print
