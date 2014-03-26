module Splice
  module Actions

    def git_commit(message)
      inside "#{base_path}" do
        git add: "--all"
        git commit: "-m '#{message}'"
      end
    end

    def remove_base_file(relative_path)
      remove_file "#{base_path}#{relative_path}"
    end

    def copy_base_file(src, dest)
      copy_file src, "#{base_path}#{dest}"
    end

    def template_with_base(src, dest)
      template src, "#{base_path}#{dest}"
    end

    def base_path
      "/Users/lev/git/github/splice/sample_apps/" + app_name + "/"
    end

  end
end