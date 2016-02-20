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

  def delete_songs(title, code, page)
    byebug
    query = "DELETE FROM songs WHERE"

    if title.present?
      query += " title = ? and"
    end
    if code.present?
      query += " bookcode = ? and"
    end
    if page.present?
      query += " page = ?"
    end
    query = query.chomp " and"

    delete_stm = @@db.prepare query

    if title.present?
      if code.present?
        if page.present?
          delete_stm.bind_params title, code, page
        else
          delete_stm.bind_params title, code
        end
      elsif page.present?
        delete_stm.bind_params title, page
      else
        delete_stm.bind_params title
      end
    elsif code.present?
      if page.present?
        delete_stm.bind_params code, page
      else
        delete_stm.bind_params code
      end
    else
      delete_stm.bind_params page
    end

    delete_stm.execute
  end

end
