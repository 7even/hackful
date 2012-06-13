ActiveAdmin.register User do
  index do
    column :name do |user|
      link_to user.name, admin_user_path(user)
    end
    
    column :email
    column :up_votes
    column :down_votes
    
    default_actions
  end
  
  show title: :name do |user|
    attributes_table do
      row :name
      row :email
      row :up_votes
      row :down_votes
    end
  end
  
  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :email
    end
    
    f.buttons
  end
end
