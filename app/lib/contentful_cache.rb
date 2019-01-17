require 'ostruct'

class ContentfulCache
  def initialize
    
  end

  def put(key, entry)
    $redis.set key, entry
    $redis.expire key, 60 * 5
  end

  def get(key)
    data = $redis.get key
    return nil if data.nil?

    return JSON.parse(data, object_class: OpenStruct)
  end
end
