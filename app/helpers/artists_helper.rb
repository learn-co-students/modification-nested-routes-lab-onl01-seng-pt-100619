module ArtistsHelper
  def display_artist(song)
    #SHORTER VERSION:
    # song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
    #LONGER VERSION:
      if song.artist.nil?
        link_to("Add Artist", edit_song_path(song))
      else
        link_to(song.artist_name, artist_path(song.artist))
      end
  end

  # Display dropdown of artists, with name if editing through nested
  def artist_select(song)
    if song.artist
      hidden_field_tag "song[artist_id]", song.artist_id
    else
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    end
  end

  # Display name if editing through nested
  def display_name(song)
    if song.artist
      song.artist.name
    end
  end
end
