class Gear

  attr_reader :chainring, :cog, :wheel

  # remove external class dependences by injecting/passing in instance of the class
  # remove argument order dependencies by using a hash of args/options
  # explicitly define defaults in separate method
  def initialize args
    args = defaults.merge(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * diameter
  end

  private

  # isolate message/method call dependences
  def diameter
    wheel.diameter
  end

  def defaults
    { chainring: 20, cog: 30, wheel: nil }
  end

end