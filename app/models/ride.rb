class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if short_tickets && short_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif
       short_tickets
     "Sorry. You do not have enough tickets to ride the #{attraction.name}."
     elsif 
     short_height
     "Sorry. You are not tall enough to ride the #{attraction.name}."
     else
       user_updates
      end
  end


  def short_tickets
    self.user.tickets < self.attraction.tickets
  end

  def short_height
    self.user.height < self.attraction.min_height
  end
  
  
   def user_updates
    self.user.update(happiness: self.user.happiness + self.attraction.happiness_rating, tickets: self.user.tickets - self.attraction.tickets, nausea: self.user.nausea + self.attraction.nausea_rating )
      "Thanks for riding the #{self.attraction.name}!"
   end
   

end

