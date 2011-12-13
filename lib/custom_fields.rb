$:.unshift File.expand_path(File.dirname(__FILE__))

require 'active_support'
require 'carrierwave/mongoid'

module CustomFields

  @@options = {
    :reserved_names => Mongoid.destructive_fields + %w(id _id send class)
  }

  def self.options=(options)
    @@options.merge!(options)
  end

  def self.options
    @@options
  end

end

require 'custom_fields/version'
require 'custom_fields/extensions/mongoid/relations/referenced/many'
require 'custom_fields/types/default'
require 'custom_fields/types/string'
require 'custom_fields/types/text'
require 'custom_fields/types/date'
require 'custom_fields/field'
require 'custom_fields/source'
require 'custom_fields/target'

# Load all the translation files
I18n.load_path += Dir[File.join(File.dirname(__FILE__), '..', 'config', 'locales', '*.yml')]

module MyBenchmark

  def self.measure(caption, &block)
    t1 = Time.now
    returned_value = block.call
    puts "[MyBenchmark] #{caption} took #{((Time.now - t1) * 1000).to_i} ms"
    returned_value
  end

end