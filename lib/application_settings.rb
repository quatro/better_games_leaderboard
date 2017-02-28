# AS
# ========================
# Handles getting and setting our main application wide config hash.

module AS

  # Returns our config hash, or if empty, returns an empty hash
  def c
    @@config ||= {}
  end

  # Sets our config class variable, which we expect to be a hash
  def c=(hash)
    @@config = hash
  end

  def append_c=(hash)
    if(!hash.nil?)
      @@config = @@config.merge(hash)end
  end

  # Awesome. Allows us to use instance methods on a Module.
  #     eg. AS.config
  module_function :c=, :append_c=, :c

end