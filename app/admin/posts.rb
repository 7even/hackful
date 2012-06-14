ActiveAdmin.register Post do
  index do
    column :title do |post|
      link_to post.title, admin_post_path(post)
    end
    
    column :text do |post|
      truncate(post.text)
    end
    
    column :link do |post|
      link_to post.link, post.link
    end
    column :up_votes
    column :down_votes
    
    bool_column :is_job
    bool_column :promoted
    
    default_actions
  end
  
  show title: :title do |post|
    attributes_table do
      row :title
      row :text
      row :link do
        link_to post.link, post.link
      end
      row :up_votes
      row :down_votes
      
      bool_row :is_job
      bool_row :promoted
    end
  end
  
  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :text
      f.input :link
      
      f.input :is_job
      f.input :promoted
    end
    
    f.buttons
  end
  
  controller do
    with_role :admin
  end
end
