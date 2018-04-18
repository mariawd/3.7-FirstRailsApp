class Product < ApplicationRecord
  has_many :orders
end

def views
    # this is equivalent to "GET product:1"
    $redis.get("product:#{id}")
  end
