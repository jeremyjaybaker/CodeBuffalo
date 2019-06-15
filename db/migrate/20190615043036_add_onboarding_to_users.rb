class AddOnboardingToUsers < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
      alter table users
        add column is_onboarded boolean not null default false;
    SQL
  end
end
