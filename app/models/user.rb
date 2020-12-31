class User < ApplicationRecord
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true
  
  # def self.search(search)
  #   if search 
  #     user = User.find_by(user_name: search)
  #     if user
  #       self.where(id: user)
  #     else
  #       User.all
  #     end
  #   else
  #     User.all
  #   end
  # end 

  def self.search(search, option)
    if (option == "email")
      where("email LIKE ?","%#{search}%") 
      else 
        if (option == "username")
          where("user_name LIKE ?","%#{search}%")
        else 
          if (option == "phone")
            where("phone LIKE ?","%#{search}%")
          else
            if (option == "phone")
              User.joins(:addresses).where("addresses.locality LIKE?", "%#{search}%")
            else
              if (option == "country")
                User.joins(:addresses).where("addresses.country LIKE?", "%#{search}%")
              else
                User.joins(:addresses).where("addresses.postal_code::text LIKE?", "%#{search}%")
              end
            end
          end
        end
      end
    end
  end
