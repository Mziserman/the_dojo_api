class Api::V1::FilesController < ApplicationController
  
  def create
    if current_user

      stream_id = params.require(:file).permit(:name, :stream_id, :format)[:stream_id]

      if Stream.find(stream_id).live == true && Stream.find(stream_id).is_saved? != true
        @file = StreamFile.create(params.require(:file).permit(:name, :stream_id, :format))
        @version = FileSave.create(version: 0, stream_file_id: @file.id, commit_message: "Debut du trackage")
        render 'create.json', status: :ok
      else
        render json: 'error', status: :error
      end

    else
      render json: 'error', status: :error
    end
  end

  # POST filename, stream_id
  # crée file avec stream_id/filename
  # crée v0, origin timestamp
  #
  # POST stream_id, commit_message
  # crée nouvelle version du fichier, en sauvegardant l'uptime
  #
  # GET stream_id
  # last saved file
  #
  # V2: GET stream_id, uptime
  # previous saved file
end
