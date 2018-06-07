module ChatroomPhotosHelper
  def find_photo(message)
    photo = ChatroomPhoto.find_by(id: message.child)
    if photo
      photo.path.url
    else
      "照片已刪除"
    end
  end
end
