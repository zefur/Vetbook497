class BookingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "hello this is my job"
  end
end
