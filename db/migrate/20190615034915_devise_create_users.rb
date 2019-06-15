# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.inet     :current_sign_in_ip
      # t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true

    execute <<-SQL
      create table budget_types(
        id serial primary key,
        created_at timestamp not null default now(),
        updated_at timestamp not null default now(),
        name varchar unique not null
      );

      insert into budget_types (name) values ('$0');
      insert into budget_types (name) values ('< $25');
      insert into budget_types (name) values ('< $50');
      insert into budget_types (name) values ('No Preference');

      alter table users
        add column interest_categories varchar[] not null default '{}';
      alter table users
        add column budget_type_id integer default 4;
      alter table users
        add column looking_for_group boolean not null default true;
    SQL
  end
end
