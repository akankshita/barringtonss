class UserSessionsController < ApplicationController
  def new
<<<<<<< HEAD
   # content = ElectricityReading.report_table_by_sql("SELECT * FROM electricity_readings ").as(:csv)
   # file = File.open("#{RAILS_ROOT}/report.csv", "w") # open file
   #   file.print(content) # print that csv content to the open file
   # file.close          # close the file
=======
    @user = User.new

>>>>>>> 6808dc825bd6dae48aef3856c83ead8324554c04
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      flash[:notice] = 'Successfully logged in'

      #record in login in db
      Record.stamp(Activity.action('logon'), current_user.id, LoggingUtils.get_ip(request.env))

      redirect_to root_url
    else
      #record the failed attempt
      Record.stamp(Activity.action('failed_logon'), -1, LoggingUtils.get_ip(request.env))

      render :action => "new"
    end
  end

  def destroy
    Record.stamp( Activity.action('logoff'), current_user.id, LoggingUtils.get_ip(request.env) )
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = 'Successfully logged out'
    redirect_to root_url
  end
end
