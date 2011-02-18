
#require 'rubygems' rescue nil
require 'wirb'
#require 'hirb'
require 'interactive_editor'
#
Wirb.start
#Wirble.colorize
#
#Hirb::View.enable

if ENV.include?('RAILS_ENV')

    if !Object.const_defined?('RAILS_DEFAULT_LOGGER')
        require 'logger'
        Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
    end

    def sql(query)
        ActiveRecord::Base.connection.select_all(query)
    end

elsif defined?(Rails) && !Rails.env.nil?
    if Rails.logger
        Rails.logger =Logger.new(STDOUT)
        ActiveRecord::Base.logger = Rails.logger
    end
    if Rails.env == 'test'
        require 'test/test_helper'
    end
else

end



#class Object
#    # Return only the methods not present on basic objects
#    def interesting_methods
#        (self.methods - Object.new.methods).sort
#    end
#end
=begin
%w{wirble pp irb/ext/save-history}.each do |lib| 
  begin 
    require lib 
  rescue LoadError => err
    $stderr.puts "Couldn't load #{lib}: #{err}"
  end
end

#Wirble.init and Wirble.colorize and maybe more afterwards
%w{init colorize}.each { |str| Wirble.send(str) }

IRB_START_TIME = Time.now

# Prompt behavior
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

#history
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE

# Loaded when we fire up the Rails console
# among other things I put the current environment in the prompt

if ENV['RAILS_ENV']
  rails_env = ENV['RAILS_ENV']
  rails_root = File.basename(Dir.pwd)
  prompt = "#{rails_root}[#{rails_env.sub('production', 'prod').sub('development', 'dev')}]"
  IRB.conf[:PROMPT] ||= {}
  
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{prompt}>> ",
    :PROMPT_S => "#{prompt}* ",
    :PROMPT_C => "#{prompt}? ",
    :RETURN   => "=> %s\n" 
  }
  
  IRB.conf[:PROMPT_MODE] = :RAILS
  
  #Redirect log to STDOUT, which means the console itself
  IRB.conf[:IRB_RC] = Proc.new do
    logger = Logger.new(STDOUT)
    ActiveRecord::Base.logger = logger
    ActiveResource::Base.logger = logger
    ActiveRecord::Base.instance_eval { alias :[] :find }
  end
  
  ### RAILS SPECIFIC HELPER METHODS
  # TODO: DRY this out
  def log_ar_to (stream)
    ActiveRecord::Base.logger = expand_logger stream
    reload!
  end

  def log_ac_to (stream)
    logger = expand_logger stream
    ActionController::Base.logger = expand_logger stream
    reload!
  end
    
  def expand_log_file(name)
    "log/#{name.to_s}.log"
  end
  
  def expand_logger(name)
    if name.is_a? Symbol
      logger = expand_log_file name
    else
      logger = name
    end
    Logger.new logger
  end
end

### IRb HELPER METHODS

#clear the screen
def clear
  system('clear')
end
alias :cl :clear

#ruby documentation right on the console
# ie. ri Array#each
def ri(*names)
  system(%{ri #{names.map {|name| name.to_s}.join(" ")}})
end

### CORE EXTENSIONS
class Object
  #methods defined in the parent class of the object
  def local_methods
    (methods - Object.instance_methods).sort
  end
  
  #copy to pasteboard
  #pboard = general | ruler | find | font
  #def to_pboard(pboard=:general)
  #  %x[printf %s "#{self.to_s}" | pbcopy -pboard #{pboard.to_s}]
  #  paste pboard
  #end
  #alias :to_pb :to_pboard

  ##paste from given pasteboard
  ##pboard = general | ruler | find | font
  #def paste(pboard=:general)
  #  %x[pbpaste -pboard #{pboard.to_s}].chomp
  #end
  #
  #def to_find
  #  self.to_pb :find
  #end  

  def eigenclass
    class << self; self; end
  end

  def ql
    %x[qlmanage -p #{self.to_s} >& /dev/null  ]
  end
end

class Class
  def class_methods
    (methods - Class.instance_methods - Object.methods).sort
  end
  
  #Returns an array of methods defined in the class, class methods and instance methods
  def defined_methods
    methods = {}
    
    methods[:instance] = new.local_methods
    methods[:class] = class_methods
    
    methods
  end
  
  def metaclass
    eigenclass
  end
end

#Readline hacks
#module Readline
#  module History
#    LOG = "#{ENV['HOME']}/.irb-history"
#
#    def self.write_log(line)
#      File.open(LOG, 'ab') {|f| f << "#{line}"}
#    end
#
#    def self.start_session_log
#      write_log("# session start: #{Time.now}")
#      at_exit { write_log("# session stop: #{Time.now}") }
#    end
#  end
#
#  alias :old_readline :readline
#  def readline(*args)
#    ln = old_readline(*args) + "\n"
#    begin
#      History.write_log(ln)
#    rescue
#    end
#    ln
#  end
#end
#
#Readline::History.start_session_log

### USEFUL ALIASES
alias q exit
=end
class Object
    def local_methods
        self.methods - Object.methods
    end
end
