Sequel.migration do
  change do
    create_table :foos do
      primary_key :id
      String :foo
      String :bar
    end
  end
end
