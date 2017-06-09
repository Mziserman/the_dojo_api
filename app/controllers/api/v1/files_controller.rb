class Api::V1::FilesController < ApplicationController

  # POST filename, stream_id
  # crée file avec stream_id/filename
  # crée v0, origin timestamp
  # Request format {file: {name: "", stream_id: "", format: ""}}
  def create
    if current_user
      stream_id = params.require(:file).permit(:stream_id)[:stream_id]

      if Stream.find(stream_id).live == true
        @file = StreamFile.create(params.require(:file).permit(:name, :stream_id, :format))
        @version = FileCommit.create(version: 0, stream_file_id: @file.id, commit_message: "Debut du trackage")
        render 'create.json', status: :ok
      else
        head(:unprocessable_entity)
      end

    else
      head(:unauthorized)
    end
  end

  # POST stream_id, commit_message
  # crée nouvelle version du fichier, en sauvegardant l'uptime
  # Request format {file: {stream_id_file: "", commit_message: ""}}
  def commit
    if current_user
      stream_file_id = params.require(:file).permit(:stream_file_id)[:stream_file_id]

      if Stream.find(stream_id).live == true
        version_last = FileCommit.where(stream_file_id: stream_file_id).last.version
        @version = FileCommit.create(params.require(:file).permit(:commit_message, :stream_file_id))
        @version.version = version_last + 1
        if @version.save
          render 'commit.json', status: :ok
        end
      else
        head(:unprocessable_entity)
      end

    else
      head(:unauthorized)
    end
  end

  #GET all version for a stream
  # Argument stream_id
  def index
    stream_id = params[:stream_id]
    @commits = Stream.find(stream_id).stream_file.file_commits

    render 'index.json'
  end

  # POST stream_id
  # download file version
  # Request format {file: {file_id: , version: }}
  def show_commit
    if current_user
      file_id = params.require(:file).permit(:file_id)[:file_id]
      version = params.require(:file).permit(:version)[:version]

      @file = StreamFile.find(file_id)
      @commit = @file.file_commits.where(version: version).last

      render 'download.json', status: :ok
    else
      head(:unprocessable_entity)
    end
  end

  # V2: GET stream_id, uptime
  # previous saved file
end
