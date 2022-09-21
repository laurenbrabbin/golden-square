require "07_time_error"

RSpec.describe TimeError do
  it "returns the difference between the remote clock and local clock" do
    requester_dbl = double :requester
    expect(requester_dbl).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"BST","client_ip":"213.230.194.2","datetime":"2022-09-21T11:46:07.650125+01:00","day_of_week":3,"day_of_year":264,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1663757167,"utc_datetime":"2022-09-21T10:46:07.650125+00:00","utc_offset":"+01:00","week_number":38}')
    time_error = TimeError.new(requester_dbl)
    time = Time.new(2022, 9, 21, 11, 46, 07) #datetime":"2022-09-21T11:46:07.650125
    expect(time_error.error(time)).to eq 0.650125 #equals this as these are the milliseconds remaining when we take the time from the url minus the time we set in 'time'
  end
end


#Steps Taken
  #1 injected current time as an arguement to the error method and removed the .Time class which is non-deterministic
  #2 instead created the time outside. Took the time from url "datetime":"2022-09-21T11:46:07.650125 and inserted it into 'time' which we can then pass through the error method
  #3 got rid of NET::HTTP which makes requests to the outside world which is also non deterministic
