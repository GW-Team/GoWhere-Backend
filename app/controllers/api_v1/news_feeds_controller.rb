class ApiV1::NewsFeedsController < ApiController
  
  def index
    begin
      news_feed_users = @user.followers_follower.all.map{|val| val.user_id}.push(@user.id)
      news_feeds = NewsFeed.where("user_id in (?)", news_feed_users).order(created_at: :desc)
      return_msg({reslut: true, news_feeds: news_feeds}, 200)
    rescue
      return_msg({message: "Server Error"}, 500)
    end
  end

  def show
    
  end

  def create
    begin
      news_feed = @user.news_feeds.create(news_feed_params)
      return_msg({ message: "新增成功。", news_feed_id: news_feed.id }, 200)
    rescue
      return_msg({ message: "新增失敗，請確認是否有欄位未填。" }, 400)
    end
  end

  def update
    begin
      @user.news_feeds.find(params.require(:id)).update(news_feed_params)
      return_msg({ message: "修改成功。" }, 200)
    rescue
      return_msg({ message: "修改失敗，請確認是否有欄位錯誤。" }, 400)
    end
  end

  def destroy
    begin
      @user.news_feeds.find(params.require(:id)).destroy()
      return_msg({ message: "刪除成功"}, 200)
    rescue
      return_msg({ message: "刪除失敗" }, 500)
    end
  end

  def upload_image
    begin
      res = []
      for key in params.require(:key_list).split(',')
        res.push(@user.news_feeds.find(params[:id]).news_feed_photos.create(path: params.require(key)))
      end
      return_msg({ message: "上傳成功。", imgs: res }, 200)
    rescue
      return_msg({ message: "上傳失敗，請再重新上傳一次。" }, 500)
    end
  end

  private
  def news_feed_params
    params.require(:news_feed_form).permit(:description, :lat, :lng, :is_private)
  end
end
