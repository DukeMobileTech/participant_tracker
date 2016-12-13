ActiveAdmin.register Survey do
  belongs_to :roster
  sidebar 'Responses', only: :show do
    ul do
      li link_to 'Responses', admin_survey_responses_path(params[:id])
    end
  end
end