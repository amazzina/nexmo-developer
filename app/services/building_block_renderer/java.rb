module BuildingBlockRenderer
  class Java
    def self.dependencies(deps)
      {
          'text' => 'Add the following to <code>build.gradle</code>:',
          'code' => deps.map { |d| "compile '#{d}'" }.join('<br />'),
      }
    end

    def self.run_command(_command, filename, file_path)
      package = file_path.gsub('.repos/nexmo-community/nexmo-java-quickstart/src/main/java/', '').tr('/', '.').gsub(filename, '')

      <<~HEREDOC
        ## Run your code
        We can use the `application` plugin for Gradle to simplify the running of our application.
         Update your `build.gradle` with the following:

         ```groovy
        apply plugin: 'application'
        mainClassName = project.hasProperty('main') ? project.getProperty('main') : ''
        ```

         Run the following `gradle` command to execute your application, replacing `#{package.chomp('.')}` with the package containing `#{filename.gsub('.java', '')}`:

         ```sh
        gradle run -Pmain=#{package}#{filename.gsub('.java', '')}
        ```

      HEREDOC
    end

    def self.create_instructions(filename)
      "Create a class named `#{filename.gsub('.java', '')}` and add the following code to the `main` method:"
    end

    def self.add_instructions(filename)
      "Add the following to the `main` method of the `#{filename.gsub('.java', '')}` class:"
    end
  end
end
