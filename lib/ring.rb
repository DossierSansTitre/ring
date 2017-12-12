require 'ring/version'

module Ring
  def root
    @root ||= Pathname.new(Dir.pwd)
  end
end
