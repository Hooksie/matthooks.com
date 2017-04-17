namespace :content do
  desc "Load HTML content to the given named snipper."
  task :load, [:name] => [:environment] do |task, args|
    snippet = Snippet.find_or_initialize_by(name: args.name)
    if snippet.new_record?
      puts "Creating new snippet"
    else
      puts "Updating existing snippet"
    end

    snippet.content = STDIN.read.strip
    snippet.save
  end

end
