comments.each do |comment|
  xml.item do
    xml.title t(".comment", :author => comment.author.display_name, :changeset_id => comment.changeset.id.to_s)

    xml.link url_for(:controller => "browse", :action => "changeset", :id => comment.changeset.id, :anchor => "c#{comment.id}", :only_path => false)
    xml.guid url_for(:controller => "browse", :action => "changeset", :id => comment.changeset.id, :anchor => "c#{comment.id}", :only_path => false)

    xml.description do
      xml.cdata! render(:partial => "comment", :object => comment, :formats => [:html])
    end

    xml.dc :creator, comment.author.display_name if comment.author

    xml.pubDate comment.created_at.to_formatted_s(:rfc822)
  end
end
