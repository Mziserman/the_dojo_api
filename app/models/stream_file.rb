class StreamFile < ApplicationRecord
  belongs_to :stream
  has_many :file_commits
end