class ApiV1::NewsFeedsController < ApiController

  def create
    begin
      news_feed = @user.news_feeds.create(news_feed_params)
      render json: { message: "新增成功。", news_feed_id: news_feed.id }, status: 200
    rescue
      render json: { message: "新增失敗，請確認是否有欄位未填。" }, status: 500
    end
  end

  def update
    begin
      @user.news_feeds.find(params.require(:id)).update(news_feed_params)
      render json: { message: "修改成功。" }, status: 200
    rescue
      render json: { message: "修改失敗，請確認是否有欄位錯誤。" }, status: 500
    end
  end

  def destroy
    begin
      del = @user.news_feeds.find(params.require(:id)).destroy()
      render json: { message: "刪除成功"}, status: 200
    rescue
      render json: { message: "刪除失敗" }, status: 500
      del.errors.full_messages
    end
  end

  def upload_image
    begin
      res = []
      for key in params.require(:key_list).split(',')
        res.push(@user.news_feeds.find(params[:id]).news_feed_photos.create(path: params.require(key)))
      end
      render json: { message: "上傳成功。", imgs: res }, status: 200
    rescue
      render json: { message: "上傳失敗，請再重新上傳一次。" }, status: 500
    end
  end

  private
  def news_feed_params
    params.require(:news_feed_form).permit(:description, :lat, :lng, :is_private)
  end
end
