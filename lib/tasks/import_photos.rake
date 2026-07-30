namespace :photos do
  desc "Import photos from images_to_import folder"
  task import: :environment do
    folder = Rails.root.join("images_to_import")
    supported_extensions = %w[.jpg .jpeg .png .gif]

    Dir.glob(File.join(folder, "*")).each do |file_path|
      next unless supported_extensions.include?(File.extname(file_path).downcase)

      filename = File.basename(file_path)
      title = File.basename(file_path, ".*").tr("_-", " ").capitalize

      photo = Photo.new(title: title)
      photo.image.attach(
        io: File.open(file_path),
        filename: filename
      )

      if photo.save
        puts "Imported: #{filename} as '#{title}'"
      else
        puts "Failed to import #{filename}: #{photo.errors.full_messages.join(', ')}"
      end
    end
  end
end
