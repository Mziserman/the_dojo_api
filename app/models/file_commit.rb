class FileCommit < ApplicationRecord
  belongs_to :stream_file
  before_save :generate_path

  def generate_path
    self.path = "/#{self.stream_file.stream.id}/#{self.stream_file.name}-#{self.version}.#{self.stream_file.format}"
    self.timestamp = Time.now.to_i
  end

end
