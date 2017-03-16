ActiveAdmin.register AndroidUpdate do
  permit_params :version, :name, :apk_update

  form do |f|
    f.inputs 'Android APK Details' do
      f.input :version, label: 'Version (Corresponds to android:versionCode)'
      f.input :name, label: 'Name (Corresponds to android:versionName)'
      f.input :apk_update, as: :file
    end
    f.actions
  end
end
