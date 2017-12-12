class HomeController < ApplicationController
before_action :authorize
  def index
    # binding.pry
    @user = User.find_by_name(params[:user])
    joining_date = @user.joining_date
    current_date = DateTime.now.to_date 
    sundays = (joining_date..current_date).count { |d| d.sunday? }
    total_days = current_date - joining_date
    total_days = total_days.to_i
    @days = total_days - sundays
    day = params[:day]
    if day == nil
      @day = Date.today.strftime("%A")
    else
      @day = day
    end
    @image = showImagebyDay(@day, @days)
  end

  def showWorkout
    respond_to do |format|
    format.html { redirect_to home_url(day: params[:day] ,user: params[:user]) }
    end
  end

  def showSchedule

    respond_to do |format|
    format.html { redirect_to home_url }
      format.js 
    end
  end

  def showImagebyDay(day, days)
    if days < 7 
        if day == "Monday"
          image = "http://watchfit.com/wp-content/uploads/2014/12/Great-gym-workout-plan-for-weight-loss-and-toning_1.jpg"
        elsif day == "Thuesday"
          image = "https://i.ytimg.com/vi/f2NcvNvyG88/hqdefault.jpg"  
        elsif day == "Wednesday"
          image = "https://i.ytimg.com/vi/f2NcvNvyG88/hqdefault.jpg"  
        elsif day == "Thursday"
          image = "http://www.medictips.com/wp-content/uploads/2017/07/gym-workout-body-building-dwayne-johnson.png"
        elsif day == "Friday"
          image = "https://www.mensfitness.com/sites/mensfitness.com/files/_main-golds-gym-trainers-go-to-bodybuilding-workouts.jpg"
        elsif day == "Saturday"
          image = "https://cdn.images.express.co.uk/img/dynamic/11/590x/secondary/Gym-workout-warning-1102309.jpg"
        else
          image = "https://i.ytimg.com/vi/f2NcvNvyG88/hqdefault.jpg"  
        end

    elsif days > 7 and days < 60
        if day == "Monday"
          image = "http://watchfit.com/wp-content/uploads/2014/12/Great-gym-workout-plan-for-weight-loss-and-toning_1.jpg"
        elsif day == "Thuesday"
          image = "https://i.ytimg.com/vi/f2NcvNvyG88/hqdefault.jpg"  
        elsif day == "Wednesday"
          image = "https://i.ytimg.com/vi/f2NcvNvyG88/hqdefault.jpg"  
        elsif day == "Thursday"
          image = "http://www.medictips.com/wp-content/uploads/2017/07/gym-workout-body-building-dwayne-johnson.png"
        elsif day == "Friday"
          image = "https://www.mensfitness.com/sites/mensfitness.com/files/_main-golds-gym-trainers-go-to-bodybuilding-workouts.jpg"
        elsif day == "Saturday"
          image = "https://cdn.images.express.co.uk/img/dynamic/11/590x/secondary/Gym-workout-warning-1102309.jpg"
        else
          image = "https://i.ytimg.com/vi/f2NcvNvyG88/hqdefault.jpg"  
        end  
    else 
        if day == "Monday"
          image = "http://watchfit.com/wp-content/uploads/2014/12/Great-gym-workout-plan-for-weight-loss-and-toning_1.jpg"
        elsif day == "Thuesday"
          image = "https://i.ytimg.com/vi/f2NcvNvyG88/hqdefault.jpg"  
        elsif day == "Wednesday"
          image = "https://i.ytimg.com/vi/f2NcvNvyG88/hqdefault.jpg"  
        elsif day == "Thursday"
          image = "http://www.medictips.com/wp-content/uploads/2017/07/gym-workout-body-building-dwayne-johnson.png"
        elsif day == "Friday"
          image = "https://www.mensfitness.com/sites/mensfitness.com/files/_main-golds-gym-trainers-go-to-bodybuilding-workouts.jpg"
        elsif day == "Saturday"
          image = "https://cdn.images.express.co.uk/img/dynamic/11/590x/secondary/Gym-workout-warning-1102309.jpg"
        else
          image = "https://i.ytimg.com/vi/f2NcvNvyG88/hqdefault.jpg"  
        end  
    end  
  return image
  end
end
