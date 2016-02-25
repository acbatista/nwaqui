module Site
  module ApplicationHelper
    
    def star_fav(property)
      if bookmark_user.present?
        bookmark = bookmark_user.bookmarks.find_by_property_id(property) rescue nil
        
        if bookmark.present?
          link_to "", bookmark_delete_path(bookmark_id: bookmark.id), remote: true, class: 'glyphicon glyphicon-star', style: 'font-size: 25px',  id: "bookmark_#{property}"
        else
          link_to "", new_bookmark_path(property_id: property), remote: true, class: 'glyphicon glyphicon-star-empty', style: 'font-size: 25px',  id: "bookmark_#{property}"
        end
      else
        link_to "", new_session_path, class: 'glyphicon glyphicon-star-empty', remote: true, style: 'font-size: 25px', id: "bookmark_#{property}"
      end
    end
  end
end