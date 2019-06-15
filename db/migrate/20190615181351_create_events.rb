class CreateEvents < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      create table events(
        id serial primary key,
        created_at timestamp not null default now(),
        updated_at timestamp not null default now(),
        user_id integer not null references users(id),
        description varchar not null,
        title varchar not null,
        duration integer not null,
        price integer not null
      );
    SQL
  end
end
