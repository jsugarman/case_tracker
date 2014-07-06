class AlterLengthUsersNameVarchar128 < ActiveRecord::Migration
  def change
  		  execute <<-SQL
	      ALTER TABLE USERS
	        ADD CONSTRAINT users_name_chk
	        CHECK (length(NAME) between 2 and 128)
	    SQL
  end
end
