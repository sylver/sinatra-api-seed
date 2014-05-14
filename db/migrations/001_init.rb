Sequel.migration do
  change do
    create_table :foos do
      primary_key :id
      String :bar
      String :ber
    end
  end
end
