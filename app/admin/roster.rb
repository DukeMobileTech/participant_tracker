ActiveAdmin.register Roster do
  sidebar 'Surveys', only: :show do
    ul do
      li link_to 'Surveys', admin_roster_surveys_path(params[:id])
    end
  end
end