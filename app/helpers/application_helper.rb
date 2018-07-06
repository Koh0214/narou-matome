module ApplicationHelper
  def resource_name
   :user
  end

  def resource
     @resource ||= User.new
  end

  def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
  end

  def title
    title = @matome.title if @matome
  end

  def description
    description = @matome.description if @matome
  end

  def default_meta_tags
    {
      site: 'なろうまとめ',
      title: title,
      reverse: true,
      charset: 'utf-8',
      description: description,
      keywords: '小説家になろう, なろう, なろう小説, おすすめ, オススメ, まとめ, なま, キュレーション, 共有',
      canonical: request.original_url,
      separator: ':',
      icon: [
        # { href: image_url('favicon.ico') },
        # { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ]
      # ,
      # og: {
      #   site_name: 'なろうまとめ',
      #   title: title,
      #   description: description,
      #   type: 'website',
      #   url: request.original_url,
      #   # image: image_url('ogp.png'),
      #   locale: 'ja_JP',
      # },
      # twitter: {
      #   card: 'summary',
      #   site: '@ツイッターのアカウント名',
      # }
    }
  end
end
