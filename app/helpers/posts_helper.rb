module PostsHelper

  def text_placeholder
    <<-"EOS".strip_heredoc
    コーデの説明文を追加
    ・ブランド名
    ・お値段
    ・こだわりポイント
    EOS
  end
end
