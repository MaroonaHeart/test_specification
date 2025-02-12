class Initialize < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :patronymic
      t.string :fullname
      t.string :email
      t.integer :age
      t.string :nationality
      t.string :country
      t.string :gender

      t.timestamps
    end

    create_table :interests do |t|
      t.string :name

      t.timestamps
    end

    create_table :skills do |t|
      t.string :name

      t.timestamps
    end

    create_table :users_skills do |t|
      t.references :user, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end

    create_table :users_interests do |t|
      t.references :user, foreign_key: true
      t.references :interest, foreign_key: true

      t.timestamps
    end
  end
end
