module PostsHelper

  def text_placeholder
    <<-"EOS".strip_heredoc
    コーデの説明文を追加
    ※100文字以内
    ・ブランド名
    ・お値段
    ・こだわりポイント
    ・スタイルのカテゴリー
    EOS
  end
end
