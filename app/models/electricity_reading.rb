require 'time_utils'
<<<<<<< HEAD
#require 'ruport'
class ElectricityReading < ActiveRecord::Base
 #  acts_as_reportable
=======

class ElectricityReading < ActiveRecord::Base
>>>>>>> 6808dc825bd6dae48aef3856c83ead8324554c04
  cattr_reader :per_page
  @@per_page = 50

  validates_presence_of :meter, :start_time, :end_time, :electricity_value

  belongs_to :electricity_upload
  belongs_to :meter
  belongs_to :user
  
  def validate
    if(start_time != nil and end_time != nil)
      errors.add(:start_time, "must be after End time") if start_time >= end_time 
    end
  end
  
  def find_time_stamp_in_js
     result = TimeUtils.convert_to_js_timestamp(self.end_time)
  end
  
  def plot_value
    self.electricity_value
  end
  
  def timestamp
    self.end_time
  end

end
