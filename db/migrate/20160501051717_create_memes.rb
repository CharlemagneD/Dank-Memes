class CreateMemes < ActiveRecord::Migration
    def change
     create_table :memes do |t|
       t.string :meme_type
       t.string :top_text
       t.string :bottom_text
       t.decimal :rating
 
       t.timestamps null: false
     end
   end
 end