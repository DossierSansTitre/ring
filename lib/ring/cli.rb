require 'ring/project_builder'

module Ring
  module CLI
    def self.run(args)
      if args.empty?
        usage
      else
        dir = args.shift
        create_project(dir)
      end
    end

    def self.usage
      puts <<-EOF
usage: ring <dir> [options...]

Create a new ring project.
      EOF
    end

    def self.create_project(dst)
      ProjectBuilder.create(dst)
    end
  end
end
