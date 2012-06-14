ActiveAdmin.register User do
  index do
    column :name do |user|
      link_to user.name, admin_user_path(user)
    end
    
    column :email
    column :up_votes
    column :down_votes
    column :banned
    
    default_actions
  end
  
  show title: :name do |user|
    attributes_table do
      row :name
      row :email
      row :up_votes
      row :down_votes
      row :banned
    end
  end
  
  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :email
      f.input :banned
    end
    
    f.buttons
  end
  
  controller do
    with_role :admin
  end
end
