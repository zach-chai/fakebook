class Song < ActiveRecord::Base

    @@db = SQLite3::Database.new "db/db_3005fakebooks"


  def update_song(title, code, page)
    update_stm = @@db.prepare "UPDATE songs SET title = ?, bookcode = ?, page = ? WHERE ID = ?"
    update_stm.bind_params title, code, page, id
    update_stm.execute
  end

  def delete_song
    delete_stm = @@db.prepare "DELETE FROM songs WHERE ID = ?"
    delete_stm.bind_params id
    delete_stm.execute
  end

end
