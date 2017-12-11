require 'fileutils'
require 'erb'

module Ring
  class ProjectBuilder
    TEMPLATE_DIR = File.expand_path('../data/template', __FILE__).freeze

    def self.create(dst)
      new(dst).run
    end

    def initialize(dst)
      @dst = dst
    end

    def run
      mkdir(nil)
      Dir[File.join(TEMPLATE_DIR, "**", "*")].each do |path|
        next if File.directory?(path)
        base_path = path[(TEMPLATE_DIR.size + 1)..-1]
        project_path = File.join(File.dirname(base_path), File.basename(base_path, ".erb"))
        content = ERB.new(File.read(path)).result
        generate_mkdir(project_path, content)
      end
    end

    private
    def mkdir(dir)
      if dir.nil?
        dir = @dst
      else
        dir = File.join(@dst, dir)
      end
      puts " * #{dir}/"
      FileUtils.mkdir_p(dir)
    end

    def generate(dst, content)
      dst = File.join(@dst, dst)
      puts " * #{dst}"
      File.write(dst, content)
    end

    def generate_mkdir(dst, content)
      components = Pathname.new(dst).cleanpath.descend.to_a
      components.each_with_index do |path, i|
        if i == components.size - 1
          generate(path, content)
        else
          mkdir(path)
        end
      end
    end
  end
end
