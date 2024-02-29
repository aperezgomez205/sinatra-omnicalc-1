require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/square/new") do
  erb(:new_sq_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2.0
  erb(:sq_results)
end

get("/square_root/new") do
  erb(:new_sqrt_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 0.5
  erb(:sqrt_results)
end

get ("/payment/new") do
  erb(:new_payment_calc)
end

get ("/payment/results") do
  @apr = params.fetch("apr").to_f
  @yrs_remain = params.fetch("yrs_remain").to_f
  @present_value = params.fetch("present_value").to_f

  @r = @apr / 12.0
  @n = @yrs_remain * 12.0

  @numerator =  (@r * @present_value)
  @denom = (1.0 - ((1.0 + @r)**-@n))

  @the_result = @numerator / @denom

  erb(:payment_results)
end
