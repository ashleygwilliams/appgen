require 'sass'

module Sass::Script::Functions
  FONTS = ["Lobster", "Raleway","Lato","Oleo_Script","Special_Elite","Fredoka_One"]
  PATTERNS = ["img/bg_stripe.png"]

  def getRandomColor(as_str = true)
    if as_str
     Sass::Script::String.new("#%06x" % (rand * 0xffffff))
   else
     Sass::Script::Color.new([rand(255), rand(255), rand(255)])
   end
  end

  def getRandomFont
    font = FONTS.sample()
    Sass::Script::String.new(font)
  end

  def getRandomPixels
    r = Random.new
    rpx = r.rand(40..60)
    Sass::Script::String.new(rpx.to_s + "px")
  end

  def getRandomPattern
    pattern = PATTERNS.sample()
    Sass::Script::String.new(pattern)
  end
end
