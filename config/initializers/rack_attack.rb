class Rack::Attack
  throttle("req/ip", limit: 60, period: 60) { |req| req.ip }
end
