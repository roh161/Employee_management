class CreateNoticeBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :notice_boards do |t|
      t.string :subject
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
