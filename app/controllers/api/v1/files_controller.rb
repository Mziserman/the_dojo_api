class Api::V1::FilesController < ApplicationController
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
