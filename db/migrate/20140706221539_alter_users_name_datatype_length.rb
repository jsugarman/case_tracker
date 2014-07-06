class AlterUsersNameDatatypeLength < ActiveRecord::Migration
  def change

  	  execute <<-SQL
	      ALTER TABLE USERS
	        ALTER COLUMN NAME SET DATA TYPE varchar(128)
	    SQL
  end
end
