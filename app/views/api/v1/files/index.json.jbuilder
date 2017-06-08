json.commits @commits do |commit|
  json.partial! 'show_version.json', version: commit
end