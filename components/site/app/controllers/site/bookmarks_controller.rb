require_dependency 'site/application_controller'

module Site
  class BookmarksController < ApplicationController
    layout 'site/bookmark'
    before_filter :validate_session!, except: [:share]

    before_action :set_user, except: [:share]

    def index
    end

    def new
      @property = Property.find(params[:property_id]) rescue nil

      if @property.present?
        @bookmark = Bookmark.new(property_id: @property.id, user_id: @user.id)
        @bookmark.save
      end
    end

    def public
      @bookmark_hash = BookmarkList.new(user_id: @user.id, token: Digest::MD5.hexdigest(@user.email))
      if @bookmark_hash.save
        redirect_to action: :share, id: @bookmark_hash.token
      else
        redirect_to action: :index
      end
    end

    def share
      @bookmark = BookmarkList.find_by_token(params[:id]) rescue nil

      if @bookmark.present?
        @bookmarks = @bookmark.user.bookmarks
        render layout: 'site/bookmark_public'
      else
        redirect_to site.root_path
      end
    end

    def destroy
      @bookmark = @user.bookmarks.find(params[:id])
      @bookmark.destroy

      flash[:success] =  "Item removido com sucesso"
      redirect_to action: :index
    end

    def delete
      @bookmark = @user.bookmarks.find(params[:bookmark_id]) rescue nil
      if @bookmark.present?
        @property = Property.find(@bookmark.property_id)
        @bookmark.destroy if @bookmark.present?
      end
    end

    private

    def set_user
      @user = Site::ExternalUser.find(session[:external_user_id])
    end
  end
end