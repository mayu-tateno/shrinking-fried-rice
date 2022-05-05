module ApplicationHelper
  def default_meta_tags
    {
      site: '冷凍チャーハンが縮みすぎてツライ',
      reverse: true,
      charset: 'utf-8',
      description: '解凍すると縮むことを想定してちょうどいい一人前の分量を目指すミニゲームです',
      keywords: '冷凍チャーハン',
      canonical: request.original_url,
      og: {
        site_name: '冷凍チャーハンが縮みすぎてツライ',
        title: '冷凍チャーハンが縮みすぎてツライ',
        description: '解凍すると縮むことを想定してちょうどいい一人前の分量を目指すミニゲームです',
        type: 'website',
        url: request.original_url,
        image: image_url('twitter_card.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@tateno2321201',
        image: image_url('twitter_card.png'),
      }
    }
  end
end
